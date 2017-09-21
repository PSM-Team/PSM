var express = require('express');
var router = express.Router();

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
  db.query("SELECT * FROM tblitem INNER JOIN tblcategories ON intItemCat= intCatID WHERE strCatName = ? ORDER BY intItemID DESC",[req.params.catname], function (err, results, fields) {
      if (err) return res.send(err);
      var tempdate = [];
      for(count=0;count<results.length;count++){
        tempdate[count] = results[count].datPostDate;
        results[count].date= tempdate[count].toDateString("en-US").slice(4, 15);
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
      var tempdate = [];
      for(count=0;count<results.length;count++){
        tempdate[count] = results[count].datPostDate;
        results[count].date= tempdate[count].toDateString("en-US").slice(4, 15);
      }
      req.post = results;
      return next();
    });
}

function render(req,res){
    res.render('categ/views/index', { cattab: req.cat });
}
function catrender(req,res){
    res.render('categ/views/catposts', {catnametab: req.catname, itemtab: req.item});
}
function postrender(req,res){
    res.render('categ/views/post',{ posttab: req.post });
}

router.get('/', fcat, render);
router.get('/:catname', fcatname, fitem, catrender);
router.get('/:catname/:postid', fpost, postrender);

exports.categories= router;
