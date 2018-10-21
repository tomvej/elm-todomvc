var express = require('express'),
    app = express(),
    port = 8080,
    bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var routes = require('./routes');
routes(app);

app.listen(port);

console.log('todo list RESTful API server started on: ' + port);
