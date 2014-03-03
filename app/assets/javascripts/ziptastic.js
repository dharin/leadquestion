(function( $ ) {
	var requests = {};
	var zipValid = {
		us: /[0-9]{5}(-[0-9]{4})?/
	};

	$.ziptastic = function(zip, callback){
		// Only make unique requests
		if(!requests[zip]) {
			requests[zip] = $.getJSON('http://zip.elevenbasetwo.com/v2/US/' + zip).fail(function() { 
				$('#country').parent().show();
				$('#state').parent().show();
				$('#city').parent().show();
			});
		} 		

		// Bind to the finished request
		requests[zip].done(function(data) {
			callback(data.country, data.state, data.city, zip);
		});

		// Allow for binding to the deferred object
		return requests[zip];
	};

	$.fn.ziptastic = function( options ) {
		return this.each(function() {
			var e = $(this);

			e.on('keyup', function() {
				var zip = e.val();

				// TODO Non-US zip codes?
				if(zipValid.us.test(zip)) {
					$.ziptastic(zip, function(country, state, city) {
						// Trigger the updated information
						e.trigger('zipChange', [country, state, city, zip]);
					})
				} 
			});
		});
	};
})( jQuery );

(function($) {
    $(function() {
        var duration = 500;

        var elements = {
            country: $('#country'),
            state: $('#state'),
            city: $('#city'),
            zip: $('#zip_code')
        }

        // Initially hide the city/state/zip
        elements.country.parent().hide();
		elements.state.parent().hide();
		elements.city.parent().hide();

        // Initialize the ziptastic and bind to the change of zip code
        elements.zip.ziptastic()
            .on('zipChange', function(evt, country, state, city, zip) {
                elements.country.val(country).parent().show(duration);
                elements.state.val(state).parent().show(duration);
                elements.city.val(city).parent().show(duration);
            });
    });
}(jQuery));

