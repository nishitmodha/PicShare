document.addEventListener("turbolinks:load", function() {

	var Photos = {
		photoHover() {
			$('.photo').hover(function() {
				$(this).children('.photo-data').toggleClass('visible');
			});
		}
	};
	Photos.photoHover();
});