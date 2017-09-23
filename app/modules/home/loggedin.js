
module.exports= (req,res,next)=>{
  var db = require('../../lib/database')();
  db.query("SELECT * FROM tbluser WHERE strSNum= ?",[req.session.user], function (err, results, fields) {
      if (err) console.log(err);
      req.valid = 1;
      if (!results[0]){
        req.valid = 0;
      }
      req.user = results;
      return next();
  });

}
