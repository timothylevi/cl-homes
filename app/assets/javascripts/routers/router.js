CL.Routers.PostsRouter = Backbone.Router.extend({
  initialize: function (postsData, $rootEl) {
    this.$rootEl = $rootEl;
		var posts = new CL.Collections.Posts(postsData);
		CL.posts = posts;
		this.collection = posts;
		this.$rootEl.html(new CL.Views.PostIndexView({posts: this.collection}).render().$el);
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