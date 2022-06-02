var express = require('express');
var exphbs = require('express-handlebars');
var args = process.argv;

var app = express();
var hbs = exphbs.create({
  // Specify helpers which are only registered on this instance.
  helpers: {
    foo: function() { return 'FOO!'; },
    bar: function() { return 'BAR!'; }
  }
});
app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');
app.enable('view cache');


app.get('/', function(req, res) {
  console.log(req.headers);
  res.render('home');
  console.log('-'.repeat(43));
});

var port = 54321;
if (args.length === 3) {
  port = Number(args[2])
}

var server = app.listen(port, function() {
  var host = server.address().address
  var port = server.address().port

  if (host === "::") {
    host = "127.0.0.1";
  }
  console.log("Backend listening at http://%s:%s", host, port)
})
