var express = require('express');
var flog = require( '../home/loggedin');
var router = express.Router();

function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}

function fregcount(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT COUNT(strSNum) AS CNT FROM dbpsm.tbluser WHERE strType!= 'admin' AND (strStatus= 'verified' OR strStatus= 'not verified')", function (err, results, fields) {
      if (err) return res.send(err);
      req.regcount = results;
      return next();
  });
}
function fvercount(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT COUNT(strSNum) AS CNT FROM dbpsm.tbluser WHERE strType!= 'admin' AND strStatus= 'verified'", function (err, results, fields) {
      if (err) return res.send(err);
      req.vercount = results;
      return next();
  });
}
function fnvercount(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT COUNT(strSNum) AS CNT FROM dbpsm.tbluser WHERE strType!= 'admin' AND strStatus= 'not verified'", function (err, results, fields) {
      if (err) return res.send(err);
      req.nvercount = results;
      return next();
  });
}
function funregcount(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT COUNT(strSNum) AS CNT FROM dbpsm.tbluser WHERE strType!= 'admin' AND strStatus= 'unregistered'", function (err, results, fields) {
      if (err) return res.send(err);
      req.unregcount = results;
      return next();
  });
}
function frejcount(req, res, next){
  var db = require('../../lib/database')();
  db.query("SELECT COUNT(strSNum) AS CNT FROM dbpsm.tbluser WHERE strType!= 'admin' AND strStatus= 'rejected'", function (err, results, fields) {
      if (err) return res.send(err);
      req.rejcount = results;
      return next();
  });
}

function fstudunreg(req, res, next){
  var db = require('../../lib/database')();
  var sql = "SELECT * FROM tbluser INNER JOIN (SELECT tblanswers.strAnswerSNum AS StudentNumber, SUM(tblchoices.boolCorrect) AS TotalScore FROM tblanswers INNER JOIN tblchoices ON tblchoices.intCHID=tblanswers.intAnswer GROUP BY tblanswers.strAnswerSNum) AS A ON strSNum=StudentNumber WHERE strStatus= 'unregistered'";
  db.query(sql, function (err, results, fields) {
      if (err) return res.send(err);
      req.stud = results;
      return next();
  });
}
function fstudreject(req, res, next){
  var db = require('../../lib/database')();
  var sql = "SELECT * FROM tbluser INNER JOIN (SELECT tblanswers.strAnswerSNum AS StudentNumber, SUM(tblchoices.boolCorrect) AS TotalScore FROM tblanswers INNER JOIN tblchoices ON tblchoices.intCHID=tblanswers.intAnswer GROUP BY tblanswers.strAnswerSNum) AS A ON strSNum=StudentNumber WHERE strStatus= 'rejected'";
  db.query(sql, function (err, results, fields) {
      if (err) return res.send(err);
      req.stud = results;
      return next();
  });
}
function freguser(req, res, next){
  var db = require('../../lib/database')();
  var sql = "SELECT * FROM tbluser INNER JOIN (SELECT tblanswers.strAnswerSNum AS StudentNumber, SUM(tblchoices.boolCorrect) AS TotalScore FROM tblanswers INNER JOIN tblchoices ON tblchoices.intCHID=tblanswers.intAnswer GROUP BY tblanswers.strAnswerSNum) AS A ON strSNum=StudentNumber WHERE strSNum= ?";
  db.query(sql,[req.params.userid], function (err, results, fields) {
      if (err) return res.send(err);
      req.reguser = results;
      return next();
  });
}

function render(req,res){
  if(req.valid==2)
    res.render('admin/views/index',{usertab: req.user, regtab: req.regcount, vertab: req.vercount, nvertab: req.nvercount, unregtab: req.unregcount, rejtab: req.rejcount});
  else if(req.valid==1)
    res.render('admin/views/invalidpages/normalonly');
  else
    res.render('login/views/invalid');
}
function studunregrender(req,res){
  if(req.valid==2)
    res.render('admin/views/registrations',{studtab: req.stud});
  else if(req.valid==1)
    res.render('admin/views/invalidpages/normalonly');
  else
    res.render('login/views/invalid');
}
function studrejrender(req,res){
  if(req.valid==2)
    res.render('admin/views/registrations',{studtab: req.stud});
  else if(req.valid==1)
    res.render('admin/views/invalidpages/normalonly');
  else
    res.render('login/views/invalid');
}
function approverender(req,res){
  if(req.valid==2){
    var db = require('../../lib/database')();
    if(req.reguser[0].TotalScore >= 7)
      var sql = "UPDATE tbluser SET strStatus= 'verified' WHERE strSNum= ?";
    else
      var sql = "UPDATE tbluser SET strStatus= 'not verified' WHERE strSNum= ?";
    db.query(sql,[req.params.userid], function (err, results, fields) {
      if (err) return res.send(err);
      res.redirect('/admin/registration-unregistered');
    });
  }
  else if(req.valid==1)
    res.render('admin/views/invalidpages/normalonly');
  else
    res.render('login/views/invalid');
}
function rejectrender(req,res){
  if(req.valid==2){
    var db = require('../../lib/database')();
    var sql = "UPDATE tbluser SET strStatus= 'rejected' WHERE strSNum= ?";
    db.query(sql,[req.params.userid], function (err, results, fields) {
      if (err) return res.send(err);
      res.redirect('/admin/registration-unregistered');
    });
  }
  else if(req.valid==1)
    res.render('admin/views/invalidpages/normalonly');
  else
    res.render('login/views/invalid');
}
function revertrender(req,res){
  if(req.valid==2){
    var db = require('../../lib/database')();
    var sql = "UPDATE tbluser SET strStatus= 'unregistered' WHERE strSNum= ?";
    db.query(sql,[req.params.userid], function (err, results, fields) {
      if (err) return res.send(err);
      res.redirect('/admin/registration-rejected');
    });
  }
  else if(req.valid==1)
    res.render('admin/views/invalidpages/normalonly');
  else
    res.render('login/views/invalid');
}

router.get('/', flog, fregcount, fvercount, fnvercount, funregcount, frejcount, render);
router.get('/registration-unregistered', flog, fstudunreg, studunregrender);
router.get('/registration-rejected', flog, fstudreject, studrejrender);
router.get('/registration/approve/:userid', flog, freguser, approverender);
router.get('/registration/reject/:userid', flog, rejectrender);
router.get('/registration/revert/:userid', flog, revertrender);

exports.admin= router;
