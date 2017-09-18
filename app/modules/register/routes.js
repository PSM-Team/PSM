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
      console.log(rand);
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
    res.render('register/views/index');
}
function CHrender(req,res){
    console.log(req.questions);
    res.render('register/views/questions', { questiontab: req.questions , choicetab: req.choices,  });
}
function FINrender(req,res){
    res.render('register/views/regformfin');
}

router.get('/', flog, render);
router.get('/test', flog, fquestrand1, fquestrand2, fquestions, fchoices, fcleanse, CHrender);
router.get('/fin', flog, FINrender);

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
    res.redirect('/register/test');
    }
    else{
      res.redirect('/register');
    }
    console.log(tempRegister);
});
router.post('/test', (req, res) => {
    console.log("POST VALUE");
    console.log(req.body);
    res.redirect('/register/fin');
});

exports.register = router;
