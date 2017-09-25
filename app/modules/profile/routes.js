var express = require('express');
var router = express.Router();
var flog = require( '../home/loggedin');

function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}

function fuser(req,res,next){
  var db = require('../../lib/database')();
  db.query("SELECT * FROM tbluser WHERE strSNum= ?",[req.params.userid], (err, results, fields) => {
      if (err) console.log(err);
      for(count=0;count<results.length;count++){
        results[count].bday= results[count].datBirthday.toDateString("en-US").slice(4, 15);
      }
      req.user= results;
      return next();
    });
}
function fedituser(req,res,next){
  var db = require('../../lib/database')();
  db.query("SELECT * FROM tbluser WHERE strSNum= ?",[req.session.user], (err, results, fields) => {
      if (err) console.log(err);
      req.user= results;
      return next();
    });
}
function ftrans(req,res,next){
  var db = require('../../lib/database')();
  db.query("SELECT B.*, strName FROM(SELECT * FROM (SELECT * FROM tbltransaction INNER JOIN tblitem ON intItemID= intTransItemID WHERE strItemSNum= ? OR strBuyerSNum= ?) AS TRANS INNER JOIN tblcategories ON intItemCat= intCatID WHERE strTransStatus= 'Ongoing') AS B INNER JOIN tbluser WHERE (strBuyerSNum = strSNum AND strSNum!= ?) OR (strItemSNum = strSNum AND strSNum!= ?) ORDER BY intTransID DESC",[req.session.user,req.session.user,req.session.user,req.session.user],(err, results, fields) => {
      if (err) console.log(err);
      for(count=0;count<results.length;count++){
        results[count].date= results[count].datDateStarted.toDateString("en-US").slice(4, 15);
        results[count].price = numberWithCommas(results[count].fltItemPrice);
      }
      req.trans= results;
      return next();
    });
}
function fmypost(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT B.*, strTransStatus FROM(SELECT * FROM(SELECT * FROM tblitem INNER JOIN tbluser ON strItemSNum= strSNum WHERE strSNum= ?) A INNER JOIN tblcategories ON intItemCat= intCatID) B LEFT JOIN tbltransaction ON intTransItemID= intItemID WHERE strTransStatus IS NULL ORDER BY intItemID DESC",[req.params.userid], (err, results, fields) => {
      if (err) console.log(err);
      for(count=0;count<results.length;count++){
        results[count].date= results[count].datPostDate.toDateString("en-US").slice(4, 15);
        results[count].price = numberWithCommas(results[count].fltItemPrice);
      }
      req.mypost = results;
      return next();
    });
}
function feditpost(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT B.*, strTransStatus FROM(SELECT * FROM(SELECT * FROM tblitem INNER JOIN tbluser ON strItemSNum= strSNum WHERE strSNum= ?) A INNER JOIN tblcategories ON intItemCat= intCatID) B LEFT JOIN tbltransaction ON intTransItemID= intItemID WHERE strTransStatus IS NULL AND intItemID= ? ORDER BY intItemID DESC",[req.params.userid, req.params.postid], (err, results, fields) => {
      if (err) console.log(err);
      if (!results[0]){
        console.log('EMPTY');
      }
      else{
        results[0].date= results[0].datPostDate.toDateString("en-US").slice(4, 15);
        results[0].price = numberWithCommas(results[0].fltItemPrice);
      }
      req.editpost = results;
      return next();
    });
}

function profilerender(req,res){
  if(req.valid==1){
    if(req.user[0].strSNum == req.session.user)
      res.render('profile/views/index',{usertab: req.user, transtab: req.trans});
    else
      res.render('profile/views/otherprofile',{usertab: req.user, transtab: req.trans});
  }
  else
    res.render('login/views/invalid');
}
function editprofilerender(req,res){
  if(req.valid==1)
    res.render('profile/views/editprofile',{usertab: req.user});
  else
    res.render('login/views/invalid');
}
function transrender(req,res){
  if(req.valid==1)
    res.render('profile/views/ongoingtrans',{transtab: req.trans, viewertab: req.user});
  else
    res.render('login/views/invalid');
}
function mypostrender(req,res){
  if(req.valid==1)
    if(req.session.user == req.mypost[0].strSNum)
      res.render('profile/views/myposts', { usertab: req.user, myposttab: req.mypost });
    else
      res.render('profile/views/otherposts', { usertab: req.user, myposttab: req.mypost });
  else
    res.render('login/views/invalid');
}
function editpostrender(req,res){
  if(req.valid==1){
    if(!req.editpost[0])
        res.render('categ/views/invalidpages/itemunavailable');
    else{
      if (req.session.user == req.editpost[0].strItemSNum)
        res.render('profile/views/editpost', { editposttab: req.editpost });
      else
        res.render('profile/views/invalidpages/unauthorized');
    }
  }
  else
    res.render('login/views/invalid');
}

router.get('/', (req, res) => {
    res.redirect('/profile/'+req.session.user);
});
router.get('/:userid', flog, fuser, profilerender);
router.get('/-/edit', flog, fedituser, editprofilerender);
router.get('/-/transactions', flog, ftrans, fedituser, transrender);
router.get('/:userid/posts', flog, fuser, fmypost, mypostrender);
router.get('/:userid/posts/:postid/edit', flog, fmypost, feditpost, editpostrender);

router.post('/-/edit', fedituser, (req, res) => {
  var db = require('../../lib/database')();
  if(req.body.studname=='' || req.body.oldpass=='' || req.body.newpass=='' || req.body.confirm=='' || req.body.email=='' || req.body.contact=='' ){
    res.render('profile/views/invalidpages/blank',{usertab: req.user});
  }
  else if( req.body.newpass === req.body.confirm ){
    db.query("SELECT strPassword FROM tbluser WHERE strSNum= ? ",[req.session.user], (err, results, fields) => {
        if (err) console.log(err);
        if(req.body.oldpass === results[0].strPassword){
          db.query("UPDATE tbluser SET strName= ?, strPassword= ?, strEmail= ?, txtContact= ? WHERE strSNum= ? ",[req.body.studname, req.body.newpass, req.body.email, req.body.contact, req.session.user], (err, results1, fields) => {
              if (err) console.log(err);
              res.redirect('/profile');
          });
        }
        else
          res.render('profile/views/invalidpages/incorrect',{usertab: req.user});
      });
  }
  else
    res.render('profile/views/invalidpages/notmatch',{usertab: req.user});
});
router.post('/:userid/posts/:postid/edit', feditpost, (req, res) => {
  var db = require('../../lib/database')();
  if(req.body.title=='' || req.body.price=='' || req.body.oldpass=='' || req.body.newpass=='' || req.body.confirm=='' ){
    res.render('profile/views/invalidpages/postblank',{editposttab: req.editpost});
  }
  else if( req.body.newpass === req.body.confirm ){
    db.query("SELECT strOrderPass FROM tblitem WHERE intItemID= ? ",[req.params.postid], (err, results, fields) => {
        if (err) console.log(err);
        console.log(results[0].strOrderPass);
        if(req.body.oldpass === results[0].strOrderPass){
          db.query("UPDATE tblitem SET strItemTitle = ?, fltItemPrice= ?, txtItemDesc= ?, strOrderPass= ?, intItemCat= ? WHERE intItemID= ? ",[req.body.title, req.body.price, req.body.description, req.body.newpass, req.body.category, req.params.postid], (err, results1, fields) => {
              if (err) console.log(err);
              res.redirect('/profile/'+req.session.user+'/posts');
          });
        }
        else
          res.render('profile/views/invalidpages/postincorrect',{editposttab: req.editpost});
      });
  }
  else
    res.render('profile/views/invalidpages/postnotmatch',{editposttab: req.editpost});
});


exports.profile= router;
