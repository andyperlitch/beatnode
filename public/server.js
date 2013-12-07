var _         = require('underscore'),
    express   = require("express"),
    ejs       = require('ejs'),
    httpProxy = require('http-proxy'),
    app       = express(),
    port      = parseInt(process.env.PORT, 10) || 4567;


// Set up the proxy that goes to the gateway
var proxy = new httpProxy.HttpProxy({
    target: {
        host: 'beatnode.me',
        port: 3000
    }
});

// Proxied requests
_.each({

  'GET'    : '/',
  'GET'    : '/sign_in.:format?',
  'DELETE' : '/sign_out.:format?',
  'GET'    : '/auth/:provider/callback.:format?',
  'POST'   : '/auth/:provider/callback.:format?',
  'GET'    : '/users/:id.:format?',
  'POST'   : '/collaborations.:format?',
  'POST'   : '/cratings.:format?',
  'GET'    : '/sounds/:id/download.:format?',
  'POST'   : '/sounds.:format?',
  'GET'    : '/sounds/:id.:format?',

}, function(route,method) {
    app[method.toLowerCase()](route, function(req, res) {
        proxy.proxyRequest(req, res);
    });
  }
);

app.configure(function(){

  // Set rendering engine to EJS
  app.engine('html', ejs.renderFile);
  app.set('view engine', 'ejs');

  app.use(express.methodOverride());

  app.use(express.bodyParser());

  app.use(express.errorHandler({
    dumpExceptions: true, 
    showStack: true
  }));

});

// Home route
app.get("/", function(req, res) {
  res.render("index");
});

app.use(express.static(__dirname + '/'));

app.listen(port);
console.log('Static server listening to ' + __dirname + '/ on port ' + port);