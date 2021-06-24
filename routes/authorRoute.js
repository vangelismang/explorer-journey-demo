const express = require('express');
const router = express.Router();
const authorService = require('../service/authorService');


router.post('/', async function (req, res, next) {
    try {
        res.json(await authorService.save(req.body));
    } catch (err) {
        console.error(`Error while saving author `, err.message);
        res.json('Error while saving author: ' + err.message)
    }
});

module.exports = router;