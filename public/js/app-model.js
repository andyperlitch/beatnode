var _ = require('underscore'), Backbone = require('backbone');

var App = Backbone.Model.extend({

	defaults: {
		user: undefined
	},

	toJSON: function() {
		var json = Backbone.Model.prototype.toJSON.call(this);
		_.each(json, function(val, key) {
			json[key] = typeof val.toJSON === 'function' ? val.toJSON() : val;
		});
		return json;
	}

});

exports = module.exports = App;