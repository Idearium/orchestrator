
var express = require('express'),
    app = express();

app.get('/', function (req, res) {

    // Return a simple response including the page hit counter (demonstrates sticky-session).
    return res.send(`Node.js responding on host ${process.env.HOSTNAME}.`);

});

app.get('/ping', function (req, res) {
    return res.status(200).end();
});

// Used to raise an exception, forcing the container to quit.
app.get('/exit', function (req, res) {

    res.status(200).send("Will exit in one second.");

    console.log('Exit requested, exit in one second.');

    setTimeout(() => {
        process.exit(1);
    }, 1000);

});

app.listen(4000, function () {
    console.log('Node.js running and awaiting incomming connections on port 4000.');
});
