var express = require('express');
var router = express.Router();
var flog = require( '../home/loggedin');

router.get('/', flog, (req, res) => {
  if(req.valid==1)
    res.render('profile/views/index');
  else
    res.render('login/views/invalid');
});
router.get('/editprofile', flog, (req, res) => {
  if(req.valid==1)
    res.render('profile/views/editprofile');
  else
    res.render('login/views/invalid');
});

exports.profile= router;
