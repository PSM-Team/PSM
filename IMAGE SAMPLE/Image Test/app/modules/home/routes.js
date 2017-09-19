var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {

        res.render('home/views/index');
});

router.post('/', (req, res) => {
  var post  = req.body;
  var name= post.user_name;

console.log(post);
console.log(name);
console.log(req.files);
if (!req.files)
    return res.status(400).send('No files were uploaded.');

var file = req.files.uploaded_image;
var img_name=file.name;

   if(file.mimetype == "image/jpeg" ||file.mimetype == "image/png"||file.mimetype == "image/gif" ){

          file.mv('public/images/upload_images/'+file.name, function(err) {

            if (err)

              return res.status(500).send(err);
            var db = require('../../lib/database')();
            var sql = "INSERT INTO `users_image`(`user_name`,`image`) VALUES ('"+name+"','"+img_name+"')";
            var query = db.query(sql, function(err, result) {
               res.render('home/views/index');
            });
         });
      } else {
        message = "This format is not allowed , please upload file with '.png','.gif','.jpg'";
        res.render('index.pug',{message: message});
};
});

exports.index = router;
