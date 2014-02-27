CL.Views.PostMapView = Backbone.View.extend({
	template: JST["map"],
	
	initialize: function(options){
		this.collection = options.posts;
		this.$el = $("<div></div>");
		this.listenTo(this.collection, "reset", this.refreshMap)
	},
	
	render: function(){
		var content = this.template();
		this.$el.html(content);
		return this;
	},
	
	remove: function() {
	  this.$el.remove();
	  this.stopListening();
	  return this;
	},
	
	populateMap: function () {
		this.loadMap(this.makeGeoJson());
	},
	
	refreshMap: function () {
		this.render();
		this.populateMap();
	},
	
	makeGeoJson: function() {
		var jsonData = [];
		
		this.collection.each(function(post){
      var description = "$" + post.escape('rent') + " / " + post.escape('beds') + " BR - " + post.escape('specific_location');

			if(post.escape('latitude') && post.escape('longitude')) {
				if (post.escape('medium_pics')) {

	        jsonData.push({
	          type: "Feature",
	          geometry: { type: "Point", coordinates: [parseFloat(post.escape('longitude')), parseFloat(post.escape('latitude'))] },
	          properties: {
	            title: "<a href=" + post.escape('url') + ">" + post.escape('title') + "</a>",
	            description: description,
	            "marker-color": "#fc4353",
	            "marker-size": "medium",
	            images: post.escape('medium_pics')
	          }
	        })
	      } else {
	        jsonData.push({
	          type: "Feature",
	          geometry: { type: "Point", coordinates: [parseFloat(post.escape('longitude')), parseFloat(post.escape('latitude'))] },
	          properties: {
	            title: "<a href=" + post.escape('url') + ">" + post.escape('title') + "</a>",
	            description: description,
	            "marker-color": "#fc4353",
	            "marker-size" : "medium"
	          }
	        })
				}
      }
		});
		
		return jsonData
	},
	
	loadMap: function (jsonPosts) {
		var map = L.mapbox.map('map', 'examples.map-9ijuk24y')
		console.log(map);
		map.featureLayer.on('layeradd', function(e) {
			if (e.layer.feature.properties.images) {
					var marker = e.layer;
			    var feature = marker.feature;
			    var images = feature.properties.images
			    var slideshowContent = '';

			    for(var i = 0; i < images.length; i++) {
			        var img = images[i];

			        slideshowContent += '<div class="image' + (i === 0 ? ' active' : '') + '">' +
			                              '<img src="' + img + '" />' +
			                            '</div>';
			    }

			    var popupContent =  '<div id="' + feature.properties.id + '" class="popup">' +
			                            '<h2>' + feature.properties.title + '</h2>' +
			                            '<div class="slideshow">' +
			                                slideshowContent +
			                            '</div>' +
			                            '<div class="cycle">' +
			                                '<a href="#" class="prev">&laquo; Previous</a>' +
			                                '<a href="#" class="next">Next &raquo;</a>' +
			                            '</div>'
			                        '</div>';


			    marker.bindPopup(popupContent,{
			        closeButton: false,
			        minWidth: 300
			    });
				}
		});
		console.log("these are the posts");
		console.log(jsonPosts);

		map.featureLayer.setGeoJSON(jsonPosts);

		$('#map').on('click', '.popup .cycle a', function() {
		    var $slideshow = $('.slideshow'),
		        $newSlide;

		    if ($(this).hasClass('prev')) {
		        $newSlide = $slideshow.find('.active').prev();
		        if ($newSlide.index() < 0) {
		            $newSlide = $('.image').last();
		        }
		    } else {
		        $newSlide = $slideshow.find('.active').next();
		        if ($newSlide.index() < 0) {
		            $newSlide = $('.image').first();
		        }
		    }

		    $slideshow.find('.active').removeClass('active').hide();
		    $newSlide.addClass('active').show();
		    return false;
		});

		map.setView([40.7056308, -73.9780035], 14)	
	}
});