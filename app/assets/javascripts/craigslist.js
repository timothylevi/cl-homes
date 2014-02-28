window.CL = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(posts) {
		CL.posts = new CL.Collections.Posts();
		CL.posts.fetch({
			success: function(collection) {
				new CL.Routers.PostsRouter(collection, $(".index-container"));
				Backbone.history.start();
				Backbone.history.navigate("", { trigger: true })
			}
		});
		
  }
};

