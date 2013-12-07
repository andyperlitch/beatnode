var _ = require('underscore'), Backbone = require('backbone');

var App = Backbone.Model.extend({

	defaults: {
		user: undefined
	}

});

exports = module.exports = App;