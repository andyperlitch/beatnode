require('backbone').$ = $;

var UserModel = require('./user-model');
var AppModel = require('./app-model');
var AppView = require('./app-view');

$(document).ready(function(){
    
    var user = new UserModel({});
    var app = new AppModel({
    	user: user
    });
    var view = new AppView({
        el: document.getElementById('#mainwrap'),
        model: app
    });
    
});