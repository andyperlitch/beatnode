require('backbone').$ = $;
var App = require('./App');
$(document).ready(function(){
    
    var app = new App({
        el: document.getElementById('#mainwrap')
    });
    
});
