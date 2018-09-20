const express = require('express');
const app = express();
const getBook = require('./resources/getBook');
const user = require('./resources/user');
const port = process.env.port || 3005;

app.use('/getBook', getBook);
app.use('/user', user);

app.listen(port, () => {
    console.log('Express server listening on port ' + port);
});
