var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {
    res.render('profile/views/index');
});
router.get('/editprofile', (req, res) => {
    res.render('profile/views/editprofile');
});

exports.editprofile= router;
exports.profile= router;
