var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {
    var db = require('../../lib/database')();
    db.query("UPDATE tbluser SET boolLoggedin= '0' WHERE boolLoggedin!= '0'", (err, results, fields) => {
        if (err)
          console.log(err);
      });
    res.render('login/views/index');
});

router.post('/', (req, res) => {
  var db = require('../../lib/database')();
  if(req.body.studnum === ""){
    res.render('login/views/invalidpages/blank');
  }
  else if(req.body.password === ""){
    res.render('login/views/invalidpages/blank');
  }
  else{
    db.query("SELECT * FROM tbluser WHERE strSNum= ? ",[req.body.studnum], (err, results, fields) => {
        if (err) console.log(err);
        if (!results[0]){
          res.render('login/views/invalidpages/incorrect');
        }
        else{
          if(req.body.password === results[0].strPassword)
          {
            db.query("UPDATE tbluser SET boolLoggedin= '1' WHERE strSNum= ? ",[req.body.studnum], (err, results, fields) => {
                if (err){
                  console.log(err);
                  }
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
