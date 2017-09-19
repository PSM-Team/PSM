var express = require('express');
var router = express.Router();

function fuser(req, res, next){
    var db = require('../../lib/database')();
    db.query("SELECT * FROM tbluser WHERE boolLoggedin= '1'", function (err, results, fields) {
        if (err) return res.send(err);
        if (!results[0]){
          res.render('home/views/invalid');
        }
        req.user = results;
        return next();
    });
  }

function render(req,res){
    res.render('home/views/index', { usertab: req.user});
}

router.get('/', fuser, render);

exports.home= router;
