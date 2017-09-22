var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {
    res.render('sell/views/index');
});

exports.sell=router;