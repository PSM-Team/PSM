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

function render(req,res){
    res.render('categ/views/index', { cattab: req.cat });
}
function catrender(req,res){
    res.render('categ/views/catposts', {catnametab: req.catname});
}

router.get('/', fcat, render);
router.get('/:catname', fcatname, catrender);

exports.categories= router;
