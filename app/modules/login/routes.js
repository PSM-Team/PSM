var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {
    var db = require('../../lib/database')();
    req.session.user = '';
    res.render('login/views/index');
});

router.post('/', (req, res) => {
  var db = require('../../lib/database')();
  if(req.body.studnum === "" || req.body.password === ""){
    res.render('login/views/invalidpages/blank');
  }
  else{
    db.query("SELECT * FROM tbluser WHERE strSNum= ? ",[req.body.studnum], (err, results, fields) => {
        if (err) console.log(err);
        if (!results[0]){
          res.render('login/views/invalidpages/incorrect');
        }
        else{
          if(req.body.password === results[0].strPassword){
            db.query("SELECT strSNum FROM tbluser WHERE strSNum= ? ",[req.body.studnum], (err, results, fields) => {
                if (err) console.log(err);
                req.session.user = results[0].strSNum;
                res.redirect('/home');
              });
          }
          else{
              res.render('login/views/invalidpages/incorrect');
          }
        }

    });
  }

});

exports.login = router;
