var express = require('express');
var router = express.Router();
var flog = require( '../home/loggedin');

router.get('/', flog, (req, res) => {
  if(req.valid==1)
    res.render('profile/views/index');
  else
    res.render('login/views/invalid');
});
router.get('/editprofile', flog, (req, res) => {
  if(req.valid==1)
    res.render('profile/views/editprofile');
  else
    res.render('login/views/invalid');
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
