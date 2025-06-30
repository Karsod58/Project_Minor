// index.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { spawn } = require('child_process');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());

app.post('/predict', (req, res) => {
  const marks = req.body;

  // Spawn Python process
  const python = spawn('python', ['E:/Minor_Project/lib/ml/predict.py', JSON.stringify(marks)]);

  let result = '';
  python.stdout.on('data', (data) => {
    result += data.toString();
  });

  python.stderr.on('data', (data) => {
    console.error(`Python error: ${data}`);
  });

  python.on('close', (code) => {
    if (code !== 0) {
      return res.status(500).json({ error: 'Prediction failed' });
    }
    res.json({ field: result.trim() });
  });
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
