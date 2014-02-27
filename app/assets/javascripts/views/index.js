CL.Views.PostIndexView = Backbone.View.extend({
  template: JST['index'],

  initialize: function (options) {
		this.collection = options.posts
		this.$el = $("<div class=post-list></div>")
    this.listenTo(this.collection, "reset", this.render)
  },

  render: function () {
    var content = this.template({ posts: this.collection });
    this.$el.html(content);
    return this;
  },
	
	remove: function() {
	  this.$el.remove();
	  this.stopListening();
	  return this;
	}
});