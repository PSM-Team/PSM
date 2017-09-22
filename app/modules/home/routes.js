var express = require('express');
var flog = require( './loggedin');
var router = express.Router();

function render(req,res){
  if(req.valid==1)
    res.render('home/views/index', { usertab: req.user});
  else
    res.render('login/views/invalid');
}

router.get('/', flog, render);

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
