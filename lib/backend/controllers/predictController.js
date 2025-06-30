const { spawn } = require('child_process');

const predictField = (req, res) => {
    const marks = req.body;
    const python = spawn('python3', [
        './ml/predict.py',
        marks.Math, marks.Physics, marks.Chemistry,
        marks.Biology, marks.CS, marks.English
    ]);

    python.stdout.on('data', (data) => {
        res.json(JSON.parse(data.toString()));
    });

    python.stderr.on('data', (data) => {
        console.error(`Python error: ${data}`);
        res.status(500).send("Prediction failed");
    });
};

module.exports = { predictField };
