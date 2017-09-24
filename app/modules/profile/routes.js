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

router.get('/', (req, res) => {
    res.redirect('/profile/'+req.session.user);
});
router.get('/:userid', flog, fuser, profilerender);
router.get('/-/edit', flog, fedituser, editprofilerender);
router.get('/-/transactions', flog, ftrans, fedituser, transrender);

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

exports.profile= router;
