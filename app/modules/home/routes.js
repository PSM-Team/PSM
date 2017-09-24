var express = require('express');
var flog = require( './loggedin');
var router = express.Router();

function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}

function fitem(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT intItemID ,strName, strItemTitle, fltItemPrice, strItemSNum, datPostDate, intItemCat, strCatName FROM (SELECT * FROM (SELECT * FROM tblitem INNER JOIN tblcategories ON intItemCat= intCatID ) AS ITEM INNER JOIN tbluser ON strItemSNum= strSNum) AS SELL LEFT JOIN tbltransaction ON intItemID= intTransItemID WHERE strTransStatus IS NULL ORDER BY intItemID DESC", function (err, results, fields) {
      if (err) return res.send(err);
      var tempdate = [];
      for(count=0;count<results.length;count++){
        results[count].date= results[count].datPostDate.toDateString("en-US").slice(4, 15);
        results[count].price = numberWithCommas(results[count].fltItemPrice);
      }
      req.item = results;
      return next();
  });
}

function render(req,res){
  if(req.valid==1)
    res.render('home/views/index', { usertab: req.user, itemtab: req.item});
  else
    res.render('login/views/invalid');
}

router.get('/', flog, fitem, render);

router.get('/contact_us', flog, (req, res) => {
    if(req.valid==1)
      res.render('home/views/contact_us');
    else
      res.render('login/views/invalid');
});
router.get('/help', flog, (req, res) => {
    if(req.valid==1)
      res.render('home/views/help');
    else
      res.render('login/views/invalid');
});
router.get('/rules', flog, (req, res) => {
    if(req.valid==1)
      res.render('home/views/rules');
    else
      res.render('login/views/invalid');
});

exports.home= router;
