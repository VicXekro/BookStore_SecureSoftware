const express = require('express');
const app = express();
const getBook = require('./resources/getBook');
const user = require('./resources/user');
const port = process.env.port || 3000;

app.use('/getBook', getBook);

app.listen(port, () => {
    console.log('Express server listening on port ' + port);
});
