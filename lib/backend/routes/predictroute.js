const express = require('express');
const router = express.Router();
const { predictField } = require('../controllers/predictController');

router.post('/predict', predictField);

module.exports = router;
