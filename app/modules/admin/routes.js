var express = require('express');
var flog = require( '../home/loggedin');
var router = express.Router();

function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}

function render(req,res){
  if(req.valid==2)
    res.render('admin/views/index',{usertab: req.user});
  else if(req.valid==1)
    res.render('admin/views/invalidpages/normalonly');
  else
    res.render('login/views/invalid');
}

router.get('/', flog, render);

exports.admin= router;
