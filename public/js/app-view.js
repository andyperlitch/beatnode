var _ = require('underscore'), Backbone = require('backbone');
var kt = require('knights-templar');
var bassview = require('bassview');

var App = bassview.extend({
    
	render: function() {
		var json = this.model.toJSON();
		var html = this.template(json);
		this.$el.html(html);
		// this.assign()
		return this;
	},

    template: kt.make(__dirname+'/app-view.html','_')

});

exports = module.exports = App;