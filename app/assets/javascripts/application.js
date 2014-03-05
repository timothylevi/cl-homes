// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//= require craigslist
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .


$(document).ready(function(){
	
	$(".thumbnail").on("mouseover", function(event){
		var picId = "#" + $(this).attr("id") + ".hidden-pic"
		$(".main-photo-container").html($(picId).html());
	});
	
	
	var showModal = function(){
		$(".modal-partial-container").addClass("has-active-modal");
	}
	
	var hideModal = function(){
		$(".modal-partial-container").removeClass("has-active-modal");
	}
	
	$(".modal").on("ajax:success", "form", function(event, data){
		this.reset();
		console.log(data);
		if (data.failed_signed_in) {
			console.log("error")
			$(".modal-errors").html(data.error_message);
		} else {
			console.log("success")
			hideModal();
			$(".header-container").html(data);
		}
	});
	
	$(".watch-button-form").on("ajax:success", function(event, data) {
		var $div = $(this).closest("div")
		
		if (data.created) {
			$div.removeClass("show-watch")
		} else if (data.destroyed) {
			$div.addClass("show-watch")
		} else if (data.not_signed_in) {
			showModal();
		}
	});
	
  $(".modal").on("click", function(event){

    $target = $(event.target);

    if($target.is(".modal-close-button")){
      event.preventDefault();
      hideModal();
    }
  });
	
});