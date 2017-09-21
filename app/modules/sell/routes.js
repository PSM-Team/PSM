var express = require('express');
var router = express.Router();

function render(req,res){
    res.render('sell/views/index', { curdatetab: req.curdate });
}

router.get('/', render);

router.post('/', (req, res) => {
  var db = require('../../lib/database')();
  console.log(req.body.category);
  if (req.body.category == "" || req.body.title == "" || req.body.price == "" || req.body.description == "" || req.body.orderpass == "" ){
    res.render('sell/views/invalidpages/blank', { curdatetab: req.curdate });
  }
  else{
    db.query("INSERT INTO tblitem ( strItemTitle, fltItemPrice, strItemSNum, datPostDate, txtItemDesc, strOrderPass, intItemCat ) VALUES ( ?, ?, (SELECT strSNum FROM tbluser WHERE boolLoggedin= '1'), (SELECT curdate() AS CD) , ?, ?, (SELECT intCatID FROM tblcategories WHERE strCatName = ?))",[req.body.title, req.body.price, req.body.description, req.body.orderpass, req.body.category], (err, results, fields) => {
        if (err) console.log(err);
        db.query("SELECT * FROM (SELECT intItemID, strCatName FROM (SELECT * FROM tblitem INNER JOIN tbluser ON strItemSNum= strSNum WHERE boolLoggedin= '1') AS Res INNER JOIN tblcategories ON intItemCat= intCatID ORDER BY intItemID DESC) AS Result LIMIT 1", (err, results1, fields) => {
          if (err) console.log(err);
          res.render('sell/views/success',{ posttab: results1});
        });
    });
  }
});
exports.sell= router;
