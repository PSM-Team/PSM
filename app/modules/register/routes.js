var auth = require( './auth')
var express = require('express');
var router = express.Router();
var arr = [], rand = [];
var registerOn = 0;

function flog(req, res, next){
    var db = require('../../lib/database')();
    db.query("UPDATE tbluser SET boolLoggedin= '0' WHERE boolLoggedin!= '0'", (err, results, fields) => {
        if (err) console.log(err);
        return next();
    });
}
function fquestrand1(req, res, next){
    var db = require('../../lib/database')();
    db.query("SELECT * FROM tblquestions WHERE boolUsed= '0'", (err, results1, fields) => {
      arr = [];
      rand = [];
      if (err) console.log(err);
      for(x=0;x<results1.length;x++){
        arr[x] = results1[x].intQuestionID;
      }
      for(x=0;x<2;x++){
        rand[x]= arr[Math.floor(Math.random()*arr.length)]
        arr.splice(arr.indexOf(rand[x]),1);
      }
      console.log(rand);
      return next();
    });
}
function fquestrand2(req, res, next){
    var db = require('../../lib/database')();
    for(x=0;x<2;x++){
      db.query("UPDATE tblquestions SET boolUsed= '1' WHERE intQuestionID= '"+ rand[x] +"'", (err, results2, fields) => {
        if (err) console.log(err);
        return next();
      });
    }

}
function fquestions(req, res, next){
    var db = require('../../lib/database')();
    db.query("SELECT * FROM tblquestions WHERE boolUsed= '1'", (err, results, fields) => {
      if (err) console.log(err);
      req.questions = results;
      return next();
    });
}
function fchoices(req, res, next){
    var db = require('../../lib/database')();
    db.query("SELECT * FROM tblquestions INNER JOIN tblchoices ON intQuestionID = intChQuestionID WHERE boolUsed = 1", (err, results, fields) => {
      if (err) console.log(err);
      req.choices = results;

      return next();
    });
}
function fcleanse(req, res, next){
    var db = require('../../lib/database')();
    db.query("UPDATE tblquestions SET boolUsed= '0' WHERE boolUsed= '1'", (err, results, fields) => {
      if (err) console.log(err);

      return next();
    });
}

function render(req,res){
    res.render('register/views/index');
}
function CHrender(req,res){
    res.render('register/views/questions', { questiontab: req.questions , choicetab: req.choices });
}

router.get('/', flog, render);
router.get('/test', fquestrand1, fquestrand2, fquestions, fchoices, fcleanse, CHrender);

router.post('/',auth, (req, res) => {
    var db = require('../../lib/database')();
    if(req.body.password === req.body.confirm && req.body.password != ""){
    db.query("INSERT INTO tbluser (strSNum, strName, strGender, datBirthday, strBranch, strEmail, txtContact, strPassword, strStatus, intCommend, intReport, strType, boolLoggedin) VALUES ('"+req.body.studnum+"','"+req.body.studname+"','"+req.body.gender+"','"+req.body.bday+"','"+req.body.branch+"','"+req.body.email+"','"+req.body.contact+"','"+req.body.password+"','unregistered','0','0','normal','0')", (err, results, fields) => {
        if (err) {
          console.log(err);
          res.redirect('/register');
        }
        res.redirect('/register/test');
    });
    }
    else{
      res.redirect('/register');
    }
});
router.post('/test', (req, res) => {
    var db = require('../../lib/database')();

});

exports.register = router;
