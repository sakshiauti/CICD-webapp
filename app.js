const express = require('express');
const greetings = require('./greetings');
const app = express();

app.get('/',(req, res) => {
    res.send(greetings('World'));
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server is running on port ${port}`));

module.exports = app;     // Exporting the app for testing purposes