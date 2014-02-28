CL.Routers.PostsRouter = Backbone.Router.extend({
  initialize: function (posts, $rootEl) {
    this.$rootEl = $rootEl;
		this.collection = CL.posts;
		this.$rootEl.html(new CL.Views.PostIndexView({posts: CL.posts}).render().$el);
  },

  routes: {
		'map': 'map',
    '': 'index'
  },

  index: function (event) {
    var view = new CL.Views.PostIndexView({posts: this.collection});
    this._swapView(view);
  },
	
	map: function (event) {
		var view = new CL.Views.PostMapView({posts: this.collection});
		this._swapView(view);
		view.populateMap();
	},
	
	_swapView: function (newView) {
	  this._currentView && this._currentView.remove();
	  this._currentView = newView;
	  this.$rootEl.html(newView.render().$el);
	}

});