var express = require('express');
var router = express.Router();
var flog = require( '../home/loggedin');

function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}

function fcat(req,res,next){
  var db = require('../../lib/database')();
  db.query("SELECT * FROM tblcategories", (err, results, fields) => {
      if (err) console.log(err);
      req.cat= results;
      return next();
    });
}
function fcatname(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT strCatName FROM tblcategories WHERE strCatName= ?",[req.params.catname], function (err, results, fields) {
      if (err) return res.send(err);
      req.catname = results;
      return next();
  });
}
function fitem(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT intItemID ,strName, strItemTitle, fltItemPrice, strItemSNum, datPostDate, intItemCat, strCatName FROM (SELECT * FROM (SELECT * FROM tblitem INNER JOIN tblcategories ON intItemCat= intCatID WHERE strCatName= ? ) AS ITEM INNER JOIN tbluser ON strItemSNum= strSNum) AS SELL LEFT JOIN tbltransaction ON intItemID= intTransItemID WHERE strTransStatus IS NULL ORDER BY intItemID DESC",[req.params.catname], function (err, results, fields) {
      if (err) return res.send(err);
      var tempdate = [];
      for(count=0;count<results.length;count++){
        results[count].date= results[count].datPostDate.toDateString("en-US").slice(4, 15);
        results[count].price = numberWithCommas(results[count].fltItemPrice);
      }
      req.item = results;
      console.log(results);
      return next();
  });
}
function fpost(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT * FROM (SELECT * FROM tblitem INNER JOIN tblcategories ON intItemCat= intCatID WHERE strCatName = ? AND intItemID = ? ) AS T INNER JOIN tbluser ON strItemSNum= strSNum ",[ req.params.catname, req.params.postid], (err, results, fields) => {
      if (err) console.log(err);
      for(count=0;count<results.length;count++){
        results[count].date= results[count].datPostDate.toDateString("en-US").slice(4, 15);
        results[count].price = numberWithCommas(results[count].fltItemPrice);
      }
      req.post = results;
      return next();
    });
}

function render(req,res){
  if(req.valid==1)
    res.render('categ/views/index', { cattab: req.cat });
  else
    res.render('login/views/invalid');
}
function catrender(req,res){
  if(req.valid==1)
    res.render('categ/views/catposts', {catnametab: req.catname, itemtab: req.item});
  else
    res.render('login/views/invalid');
}
function postrender(req,res){
  if(req.valid==1){
    var db = require('../../lib/database')();
    db.query("SELECT * FROM tbltransaction WHERE intTransItemID = ? AND strTransStatus IS NOT NULL",[ req.params.postid], (err, results, fields) => {
    if (err) console.log(err);
    if(!results[0])
      res.render('categ/views/post',{ posttab: req.post });
    else
      res.render('categ/views/invalidpages/orderunavailable',{ posttab: req.post });
      });
    }
  else
    res.render('login/views/invalid');
}
function orderrender(req,res){
  if(req.valid==1){
    var db = require('../../lib/database')();
    db.query("SELECT * FROM tbltransaction WHERE intTransItemID = ? AND strTransStatus IS NOT NULL",[ req.params.postid], (err, results, fields) => {
    if (err) console.log(err);
    if(!results[0])
      res.render('categ/views/order',{ posttab: req.post });
    else
      res.render('categ/views/invalidpages/orderunavailable',{ posttab: req.post });
    });
  }
  else
    res.render('login/views/invalid');
}

router.get('/', flog, fcat, render);
router.get('/:catname', flog, fcatname, fitem, catrender);
router.get('/:catname/:postid', flog, fpost, postrender);
router.get('/:catname/:postid/order', flog, fpost, orderrender);

router.post('/:catname/:postid/order', fpost, (req, res) => {
  var db = require('../../lib/database')();
  if( req.body.orderpass == ''){
    res.render('categ/views/invalidpages/orderblank',{ posttab: req.post });
  }
  else{
    db.query("SELECT strOrderPass FROM tblitem WHERE intItemID= ?",[req.params.postid], (err, results, fields) => {
        if (err) console.log(err);
        if(req.body.orderpass === results[0].strOrderPass ){
          db.query("INSERT INTO tbltransaction ( intTransItemID, strBuyerSNum, datDateStarted, strTransStatus ) VALUES ( ?, ?, (SELECT curdate() AS CD) , 'Ongoing' )",[req.params.postid, req.session.user], (err, results, fields) => {
            if (err) console.log(err);

            res.render('categ/views/ordersuccess',{ posttab: req.post });
          });
        }
        else{
          res.render('categ/views/invalidpages/orderincorrect',{ posttab: req.post });
        }
    });
  }


});

exports.categories= router;
