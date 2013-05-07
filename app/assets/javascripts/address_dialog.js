(function () {

    AddressDialog = new function () {

        var DEFAULT_MAP_ZOOM = 10;
        var DEFAULT_MAP_LOCATION = {
            latitude: 55.749646,
            longitude: 37.623680000000036
        };

        var self = this;
        var modal;
        var isNew = false;

        var latitudeInput;
        var longitudeInput;
        var mapCanvas;
        var addressInput;
        var googleMap;
        var googleGeocoder;

        this.showNew = function (parent) {

            self.show(parent, true);

            var title = parent.find('.address-title');
            title.hide();
            modal.find('input[type=text], textarea').val('');
        };

        this.show = function (parent, isNew) {

            self.isNew = isNew != undefined && isNew;

            latitudeInput = parent.find('.address-latitude');
            longitudeInput = parent.find('.address-longitude');
            mapCanvas = parent.find('#map_canvas').get(0);
            addressInput = parent.find('.address-input');

            modal = parent.find('#address-info');
            modal.modal("show");
            self.initMap();
            self.initGeoCoder();
            self.initButtons($(parent).parents('.fields'), modal);
        };

        this.initButtons = function (parent, modal, isNew) {

            var title = parent.find('.address-title');

            parent.find('#cancel-btn').click(function () {
                if (isNew) {
                    parent.find('.remove_nested_fields').click();
                }
                modal.modal("hide");
            });
            parent.find('#save-btn').click(function () {

                var address = modal.find('.address-input').val();
                title.find('#title').text(address);
                title.show();
                modal.modal("hide");
            });
        };

        this.initMap = function () {

            googleMap = new google.maps.Map(mapCanvas, { zoom: DEFAULT_MAP_ZOOM,
                mapTypeId: google.maps.MapTypeId.ROADMAP });

            var latitude = DEFAULT_MAP_LOCATION.latitude;
            var longitude = DEFAULT_MAP_LOCATION.longitude;
            if (!self.isNew) {

                latitude = latitudeInput.val();
                longitude = longitudeInput.val();
            }

            var center = new google.maps.LatLng(latitude, longitude);
            var marker = new google.maps.Marker({ map: googleMap, position: center });

            setTimeout(function () {
                google.maps.event.trigger(mapCanvas, 'resize');
                googleMap.panTo(center);

            }, 1000);
        };

        this.initGeoCoder = function () {

            googleGeocoder = new google.maps.Geocoder();
            addressInput.keypress(function () {

                var address = $(this).val();
                googleGeocoder.geocode({ 'address': address}, function (results, status) {

                    if (status == google.maps.GeocoderStatus.OK) {

                        console.log(results[0].geometry.location);

                        googleMap.setCenter(results[0].geometry.location);
                        var marker = new google.maps.Marker({
                            map: googleMap,
                            position: results[0].geometry.location
                        });

                        var latitude = results[0].geometry.location.kb;
                        var longitude = results[0].geometry.location.lb;
                        console.log('lat: ' + latitude + '; lon: ' + longitude);
                        latitudeInput.val(latitude);
                        longitudeInput.val(longitude);
                    }
                });
            });
        };
    };

})();