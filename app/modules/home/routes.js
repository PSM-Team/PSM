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

router.get('/contact_us', (req, res) => {
    res.render('home/views/contact_us');
});
router.get('/help', (req, res) => {
    res.render('home/views/help');
});
router.get('/rules', (req, res) => {
    res.render('home/views/rules');
});
router.get('/contact_us', (req, res) => {
    res.render('home/views/contact_us');
});
router.get('/help', (req, res) => {
    res.render('home/views/help');
});
router.get('/rules', (req, res) => {
    res.render('home/views/rules');
});

exports.contact_us= router;
exports.help= router;
exports.rules= router;
exports.home= router;
