var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {
    res.render('home/views/index');
});

exports.home= router;
