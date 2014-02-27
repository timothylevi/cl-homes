window.CL = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(posts) {
		new CL.Routers.PostsRouter(posts, $(".index-container"));
		Backbone.history.start();
		Backbone.history.navigate("", { trigger: true })
  }
};

