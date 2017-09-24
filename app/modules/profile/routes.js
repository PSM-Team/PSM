var express = require('express');
var router = express.Router();
var flog = require( '../home/loggedin');

function fuser(req,res,next){
  var db = require('../../lib/database')();
  db.query("SELECT * FROM tbluser WHERE strSNum= ?",[req.params.userid], (err, results, fields) => {
      if (err) console.log(err);
      for(count=0;count<results.length;count++){
        results[count].bday= results[count].datBirthday.toDateString("en-US").slice(4, 15);
      }
      req.user= results;
      return next();
    });
}
function fedituser(req,res,next){
  var db = require('../../lib/database')();
  db.query("SELECT * FROM tbluser WHERE strSNum= ?",[req.session.user], (err, results, fields) => {
      if (err) console.log(err);
      req.user= results;
      return next();
    });
}
function ftrans(req,res,next){
  var db = require('../../lib/database')();
  db.query("SELECT * FROM (SELECT * FROM tbltransaction INNER JOIN tblitem ON intItemID= intTransItemID WHERE strItemSNum= ? OR strBuyerSNum= ?) AS TRANS INNER JOIN tblcategories ON intItemCat= intCatID",[req.params.userid, req.params.userid], (err, results, fields) => {
      if (err) console.log(err);
      req.trans= results;
      return next();
    });
}

function profilerender(req,res){
  if(req.valid==1)
    res.render('profile/views/index',{usertab: req.user, transtab: req.trans});
  else
    res.render('login/views/invalid');
}
function editprofilerender(req,res){
  if(req.valid==1)
    res.render('profile/views/editprofile',{usertab: req.user});
  else
    res.render('login/views/invalid');
}

router.get('/', (req, res) => {
    res.redirect('/profile/'+req.session.user);
});
router.get('/:userid', flog, fuser, ftrans, profilerender);
router.get('/-/edit', flog, fedituser, editprofilerender);

router.post('/-/edit', fedituser, (req, res) => {
  var db = require('../../lib/database')();
  console.log(req.body);
  if(req.body.studname=='' || req.body.oldpass=='' || req.body.newpass=='' || req.body.confirm=='' || req.body.email=='' || req.body.contact=='' ){
    res.render('profile/views/invalidpages/blank',{usertab: req.user});
  }
  else if( req.body.newpass === req.body.confirm ){
    console.log('SUBMITTED');
    db.query("SELECT strPassword FROM tbluser WHERE strSNum= ? ",[req.session.user], (err, results, fields) => {
        if (err) console.log(err);
        if(req.body.oldpass === results[0].strPassword){
          db.query("UPDATE tbluser SET strName= ?, strPassword= ?, strEmail= ?, txtContact= ? WHERE strSNum= ? ",[req.body.studname, req.body.newpass, req.body.email, req.body.contact, req.session.user], (err, results1, fields) => {
              if (err) console.log(err);
              res.redirect('/profile');
          });
        }
        else
          res.render('profile/views/invalidpages/incorrect',{usertab: req.user});
      });
  }
  else
    res.render('profile/views/invalidpages/notmatch',{usertab: req.user});
});
// router.post('/', (req, res) => {
//     var post  = req.body;
//     var name= post.user_name;
  
//   console.log(post);
//   console.log(name);
//   console.log(req.files);
//   if (!req.files)
//       return res.status(400).send('No files were uploaded.');
  
//   var file = req.files.uploaded_image;
//   var img_name=file.name;
  
//      if(file.mimetype == "image/jpeg" ||file.mimetype == "image/png"||file.mimetype == "image/gif" ){
  
//             file.mv('public/images/upload_images/'+file.name, function(err) {
  
//               if (err)
  
//                 return res.status(500).send(err);
//               var db = require('../../lib/database')();
//               var sql = "INSERT INTO `users_image`(`user_name`,`image`) VALUES ('"+name+"','"+img_name+"')";
//               var query = db.query(sql, function(err, result) {
//                  res.render('profle/views/editprofile');
//               });
//            });
//         } else {
//           message = "This format is not allowed , please upload file with '.png','.gif','.jpg'";
//           res.render('editprofile.pug',{message: message});
//   };
//   });
  


//exports.editprofile= router;
exports.profile= router;
