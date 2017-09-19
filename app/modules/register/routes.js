var auth = require( './auth')
var express = require('express');
var router = express.Router();
var questArray = [], rand = [];
var registerOn = 0;
var tempRegister = {studnum:"" , studname:"", gender:"", bday:"", branch:"", email:"", contact:"", password:""};

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
      questArray = [];
      rand = [];
      if (err) console.log(err);
      for(count=0;count<results1.length;count++){
        questArray[count] = results1[count].intQuestionID;
      }
      for(count=0;count<2;count++){
        rand[count]= questArray[Math.floor(Math.random()*questArray.length)]
        questArray.splice(questArray.indexOf(rand[count]),1);
      }
      return next();
    });
}
function fquestrand2(req, res, next){
    var db = require('../../lib/database')();
    for(count=0;count<2;count++){
      db.query("UPDATE tblquestions SET boolUsed= '1' WHERE intQuestionID= ? ",[rand[count]], (err, results2, fields) => {
        if (err) console.log(err);
        return next();
      });
    }
}
function fquestions(req, res, next){
    var db = require('../../lib/database')();
    db.query("SELECT * FROM tblquestions WHERE boolUsed= '1'", (err, results, fields) => {
      if (err) console.log(err);
      for(count= 0;count<results.length;count++){
        results[count].itemnum = count + 1;
      }
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
    registerOn = 0;
    res.render('register/views/index');
}
function randredirect(req,res){
    if (registerOn == 1){
      res.redirect('test');
    }
    else{
      res.render('register/views/regoff');
    }
}
function CHrender(req,res){
    if (registerOn == 1){
      res.render('register/views/questions', { questiontab: req.questions , choicetab: req.choices,  });
    }
    else{
      res.render('register/views/regoff');

    }
}
function FINrender(req,res){
    if (registerOn == 1){
      registerOn = 0;
      res.render('register/views/regformfin');
    }
    else{
      res.render('register/views/regoff');
    }

}

router.get('/', flog, fcleanse, render);
router.get('/rand', flog, fcleanse, fquestrand1, fquestrand2, randredirect);
router.get('/test', flog, fquestions, fchoices, CHrender);
router.get('/fin', flog, fcleanse, FINrender);

router.post('/',auth, (req, res) => {
    var db = require('../../lib/database')();
    if(req.body.password === req.body.confirm && req.body.password != ""){
    tempRegister.studnum = req.body.studnum;
    tempRegister.studname = req.body.studname;
    tempRegister.gender = req.body.gender;
    tempRegister.bday = req.body.bday;
    tempRegister.branch = req.body.branch;
    tempRegister.email = req.body.email;
    tempRegister.contact = req.body.contact;
    tempRegister.password = req.body.password;
    registerOn = 1;
    res.redirect('/register/rand');
    }
    else{
      res.redirect('/register');
    }
});
router.post('/test', (req, res) => {
    var db = require('../../lib/database')();
    var choice = [ req.body.choice1, req.body.choice2];
    db.query("INSERT INTO tbluser (strSNum, strName, strGender, datBirthday, strBranch, strEmail, txtContact, strPassword, strStatus, intCommend, intReport, strType, boolLoggedin) VALUES (?,?,?,?,?,?,?,?,'unregistered','0','0','normal','0')",[tempRegister.studnum,tempRegister.studname,tempRegister.gender,tempRegister.bday,tempRegister.branch,tempRegister.email,tempRegister.contact,tempRegister.password], (err, results, fields) => {
        if (err) console.log(err);
        for(count=0;count<2;count++){
          db.query("INSERT INTO tblanswers (strAnswerSNum, intAnswer) VALUES (?,?)",[tempRegister.studnum, choice[count]], (err, results, fields) => {
            if (err) console.log(err);
          });
        }
        res.redirect('/register/fin');
    });
});

exports.register = router;
