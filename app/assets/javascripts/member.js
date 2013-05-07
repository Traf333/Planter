$(function () {

    initMap();
});

function initMap() {

    var canvas = $('#member').find('#map_canvas').get(0);
    var map = new google.maps.Map(canvas, { zoom: 10, mapTypeId: google.maps.MapTypeId.ROADMAP });

    var bounds = new google.maps.LatLngBounds();

    var openedInfoWindow = null;
    $('#addresses .address').each(function (index, addressDiv) {

        var lat = parseFloat($(addressDiv).find('#latitude').val());
        var lon = parseFloat($(addressDiv).find('#longitude').val());
        var address = $(addressDiv).find('#info').val();

        var pos = new google.maps.LatLng(lat, lon);
        var marker = new google.maps.Marker({
            position: pos,
            title: address
        });

        marker.setMap(map);
        map.panTo(pos);
        bounds.extend(pos);

        var infowindow = new google.maps.InfoWindow({
            content: $(addressDiv).find('.map-bubble').get(0)
        });

        var showPopup = function () {

            if (openedInfoWindow != null)
                openedInfoWindow.close();
            infowindow.open(map, marker);
            openedInfoWindow = infowindow;
        };

        google.maps.event.addListener(marker, 'click', showPopup);
        $(addressDiv).find('.show-on-map-link').click(showPopup);
    });

    setTimeout(function () {
        google.maps.event.trigger(canvas, 'resize');
        map.fitBounds(bounds);
    }, 1000);
}