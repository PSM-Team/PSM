var express = require('express');
var router = express.Router();

router.get('/', (req, res) => {
    res.render('home/views/index');
});
router.get('/contact_us', (req, res) => {
    res.render('home/views/contact_us');
});
router.get('/help', (req, res) => {
    res.render('home/views/help');
});
router.get('/rules', (req, res) => {
    res.render('home/views/rules');
});

exports.home= router;
