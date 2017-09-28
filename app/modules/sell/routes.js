var express = require('express');
var router = express.Router();
var flog = require( '../home/loggedin');

function render(req,res){
  if(req.valid==1)
    res.render('sell/views/index', { curdatetab: req.curdate });
  else if(req.valid==2)
    res.render('home/views/invalidpages/adminonly');
  else
    res.render('login/views/invalid');
}

router.get('/', flog, render);

router.post('/', (req, res) => {
  var db = require('../../lib/database')();
  console.log(req.body.category);
  if (req.body.category == "" || req.body.title == "" || req.body.price == "" || req.body.description == "" || req.body.orderpass == "" ){
    res.render('sell/views/invalidpages/blank', { curdatetab: req.curdate });
  }
  else{
    db.query("INSERT INTO tblitem ( strItemTitle, fltItemPrice, strItemSNum, datPostDate, txtItemDesc, strOrderPass, intItemCat ) VALUES ( ?, ?, ?, (SELECT curdate() AS CD) , ?, ?, (SELECT intCatID FROM tblcategories WHERE strCatName = ?))",[req.body.title, req.body.price, req.session.user, req.body.description, req.body.orderpass, req.body.category], (err, results, fields) => {
        if (err) console.log(err);
        db.query("SELECT * FROM (SELECT intItemID, strCatName FROM (SELECT * FROM tblitem INNER JOIN tbluser ON strItemSNum= strSNum WHERE strSNum= ?) AS Res INNER JOIN tblcategories ON intItemCat= intCatID ORDER BY intItemID DESC) AS Result LIMIT 1",[req.session.user], (err, results1, fields) => {
          if (err) console.log(err);
          res.render('sell/views/success',{ posttab: results1});
        });
    });
  }
});

exports.sell= router;
