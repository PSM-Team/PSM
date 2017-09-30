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
      var page = 1, pagearr = [1], curpage = [req.params.page], prevpage = [req.params.page - 1], nextpage = [parseInt(req.params.page)+1], lastpage = [], status = [];
      if (!results[0])
        console.log('');
      else{
        for(count=0;count<results.length;count++){
          results[count].page = page;
          results[count].curpage = req.params.page;
          if((count+1)%5==0){
            page+=1;
          }
        }
        lastpage[0] = results[results.length-1].page;
        status[0] = results[results.length-1].strStatus;
      }
      if(req.params.page > 5){
        pagearr[0] = req.params.page - 5;
      }
      for(count=1;count<10;count++){
        pagearr[count] = pagearr[count-1] + 1;
      }
      req.status = status;
      req.lastpage = lastpage;
      req.curpage = curpage;
      req.prevpage = prevpage;
      req.nextpage = nextpage;
      req.page = pagearr;
      req.stud = results;
      return next();
  });
}
function fstudreject(req, res, next){
  var db = require('../../lib/database')();
  var sql = "SELECT * FROM tbluser INNER JOIN (SELECT tblanswers.strAnswerSNum AS StudentNumber, SUM(tblchoices.boolCorrect) AS TotalScore FROM tblanswers INNER JOIN tblchoices ON tblchoices.intCHID=tblanswers.intAnswer GROUP BY tblanswers.strAnswerSNum) AS A ON strSNum=StudentNumber WHERE strStatus= 'rejected'";
  db.query(sql, function (err, results, fields) {
      if (err) return res.send(err);
      var page = 1, pagearr = [1], curpage = [req.params.page], prevpage = [req.params.page - 1], nextpage = [parseInt(req.params.page)+1], lastpage = [], status = [];
      if (!results[0])
        console.log('');
      else{
        for(count=0;count<results.length;count++){
          results[count].page = page;
          results[count].curpage = req.params.page;
          if((count+1)%5==0){
            page+=1;
          }
        }
        lastpage[0] = results[results.length-1].page;
        status[0] = results[results.length-1].strStatus;
      }
      if(req.params.page > 5){
        pagearr[0] = req.params.page - 5;
      }
      for(count=1;count<10;count++){
        pagearr[count] = pagearr[count-1] + 1;
      }
      req.status = status;
      req.lastpage = lastpage;
      req.curpage = curpage;
      req.prevpage = prevpage;
      req.nextpage = nextpage;
      req.page = pagearr;
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
    res.render('admin/views/registrations',{studtab: req.stud, pagetab: req.page, curpagetab: req.curpage, prevpagetab: req.prevpage, nextpagetab: req.nextpage, lastpagetab: req.lastpage, statustab: req.status});
  else if(req.valid==1)
    res.render('admin/views/invalidpages/normalonly');
  else
    res.render('login/views/invalid');
}
function studrejrender(req,res){
  if(req.valid==2)
    res.render('admin/views/registrations',{studtab: req.stud, pagetab: req.page, curpagetab: req.curpage, prevpagetab: req.prevpage, nextpagetab: req.nextpage, lastpagetab: req.lastpage, statustab: req.status});
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
      res.redirect('/admin/registration-unregistered/1');
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
      res.redirect('/admin/registration-unregistered/1');
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
      res.redirect('/admin/registration-rejected/1');
    });
  }
  else if(req.valid==1)
    res.render('admin/views/invalidpages/normalonly');
  else
    res.render('login/views/invalid');
}

router.get('/', flog, fregcount, fvercount, fnvercount, funregcount, frejcount, render);
router.get('/registration-unregistered/:page', flog, fstudunreg, studunregrender);
router.get('/registration-rejected/:page', flog, fstudreject, studrejrender);
router.get('/registration/approve/:userid', flog, freguser, approverender);
router.get('/registration/reject/:userid', flog, rejectrender);
router.get('/registration/revert/:userid', flog, revertrender);

exports.admin= router;
