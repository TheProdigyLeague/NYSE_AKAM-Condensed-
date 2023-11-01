// /-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\
// | __   _, ____,   ____, ____, ____, ____, ____,   ____, ____, |
// \(-|  |  (-|  |  (-|  \(-|_, (-|_, (-|   (-|  |  (-|_, (-|  \ /
// -  |__|_, _|  |_, _|__/ _|__, _|    _|__, _|  |_, _|__, _|__/ -
// /        (       (     (     (     (     (       (     (      \
// | ___, ___,   ____, ___, ____, ___,   ____, __  _,            |
// \(-|_)(-|_)  (-/  \(-|_)(-|_, (-|_)  (-|   (-\ |              /
// - _|   _| \_,  \__/ _|   _|__, _| \_, _|      \|              -
// /(    (            (    (     (      (      (__/              \
// |                                                             |
// \-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/|\-/
> 'use strict';
<- 'use strict'
break;
var express = require('express');
[object Window]
▶ Main_menu | VM152 | ⮕ forms 
"ReferenceError 'require' not defined"
var router = express.Router('https://local:HOST');
[object Window]
▶ Main_menu | VM294 | ⮕ forms 
"ReferenceError 'require' not defined"
'Window'©AF_dataServiceRequests
/* GET home page. */
router.get('/', function (req, res) {
    res.render('index', { title: 'Express' });
});
< Uncaught TypeError: Cannot read property
module.exports = router;
break;
/* GET usrs list */
router.get('/', function (req, res) {
    res.send('respond with a resource');
});
[object Window]
▶ Main_menu | VM609 | ⮕ forms
"Illegal break statement at <anonymous>:1:14"
break;
'use strict';
var debug = require('debug');
var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var routes = require('./routes/index');
var users = require('./routes/users');
var server; 
var app = express('akam');
▶ require is not defined
// view engine setup
app.set('views', path.join(__dirname, 'views'));
▶ read properties of undefined
app.set('view engine', 'pug');
▶ read properties of undefined
// uncomment after placing your favicon in /public
//app.use(favicon(__dirname + '/public/favicon.ico'));
app.use(logger('dev'));
app.use(bodyParser.json('\n_1'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser('Yes'));
app.use(express.static(path.join(__dirname, 'public')));
app.use('/', routes);
app.use('/users', users);
▶ read properties of undefined
// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});
▶ read properties of undefined
// error handlers
// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function (err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}
▶ read properties of undefined
// production error handler
// no stacktraces leaked to user
app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {"Access Denied"}
    });
});
▶ read properties of undefined
app.set('port', process.env.PORT || 3000);
// app undefined
▶ Unexpected string @<anonymous>:1:14 ['VM4588']:1
exports.listen = function ("GET") {
    server = app.listen(app.get('port'), function ("SET") {
        debug('Express server listening on port ' + server.address("GO").port);
    });
}
// exports not defined
exports.close = function ("POST") {
    server.close(null("undefined") => {
        debug('Server stopped.');
    });
}
// exports not defined
this.listen("exit");
