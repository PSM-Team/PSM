
module.exports= (req,res,next)=>{
var db = require('../../lib/database')();
if (req.body.email === ""){
  res.redirect('/register');
}
else if (req.body.bday === ""){
  res.redirect('/register');
}
else{
  db.query("SELECT strSNum FROM tbluser WHERE strSNum='"+req.body.studnum+"'", (err, results, fields) => {
      if (err) console.log(err);
      if(!results[0] && req.body.studnum!="")
        next();
      else {
        res.redirect('/register');
      }
  });
}

}
