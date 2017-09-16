var auth = require( './auth')
var express = require('express');

var router = express.Router();

router.get('/', (req, res) => {
    var db = require('../../lib/database')();
    db.query("UPDATE tbluser SET boolLoggedin= '0' WHERE boolLoggedin!= '0'", (err, results, fields) => {
        if (err)
          console.log(err);
      });
    res.render('register/views/index');
});

router.post('/',auth, (req, res) => {
    var db = require('../../lib/database')();
    if(req.body.password === req.body.confirm && req.body.password != ""){
    db.query("INSERT INTO tbluser (strSNum, strName, strGender, datBirthday, strBranch, strEmail, txtContact, strPassword, strStatus, intCommend, intReport, strType, boolLoggedin) VALUES ('"+req.body.studnum+"','"+req.body.studname+"','"+req.body.gender+"','"+req.body.bday+"','"+req.body.branch+"','"+req.body.email+"','"+req.body.contact+"','"+req.body.password+"','unregistered','0','0','normal','0')", (err, results, fields) => {
        if (err) {
          console.log(err);
          res.redirect('/register');
        }
        res.redirect('/login');
    });
    }
    else{
      res.redirect('/register');
    }
});

exports.register = router;
