var map;
var markersArray = [];
var bounds = new google.maps.LatLngBounds();

function initMap(railsMarkers) {
          map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 0, lng: 0},
          zoom: 6
        });
    var infoWindow = new google.maps.InfoWindow({map: map});

      //   // Try HTML5 geolocation.
      //   if (navigator.geolocation) {
      //     navigator.geolocation.getCurrentPosition(function(position) {
      //       var pos = {
      //         lat: position.coords.latitude,
      //         lng: position.coords.longitude
      //       };

      //       infoWindow.setPosition(pos);
      //       infoWindow.setContent('Location found.');
      //       map.setCenter(pos);
      //     }, function() {
      //       handleLocationError(true, infoWindow, map.getCenter());
      //     });
      //   } else {
      //     // Browser doesn't support Geolocation
      //     handleLocationError(false, infoWindow, map.getCenter());
      //   };


      // function handleLocationError(browserHasGeolocation, infoWindow, pos) {
      //   infoWindow.setPosition(pos);
      //   infoWindow.setContent(browserHasGeolocation ?
      //                         'Error: The Geolocation service failed.' :
      //                         'Error: Your browser doesn\'t support geolocation.');
      // };


      // var assets = gon.assets;
      // for (var i = 0; i < assets.length; i++) {
      //   console.log(assets[i]["title"]);
      // }

      for (var i = 0; i < railsMarkers.length; i++) {
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(railsMarkers[i]["lat"], railsMarkers[i]["lng"]),
          map: map
        });
        markersArray.push(marker);
        bounds.extend(marker.position);


        // var content ='<div class="map_box" style="padding: 10px;">'+'<h3>'assets[i].title'</h3>'+
        // '<p>'assets[i].address_combined'</p>'+'</div>';

        google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
            infoWindow.setContent(content);
            infoWindow.open(map, marker);
          }
        })(marker, i));

      };

      map.fitBounds(bounds);
      console.log(gon.assets);

};

function removeMarkers() {
  // console.log(markersArray);
  for (var i = 0; i < markersArray.length; i++) {
    markersArray[i].setMap(null);
  }
  markersArray.length = 0;
  console.log('Should be empty');
  console.log(markersArray);
};



function addMarkers(railsMarkers) {
      for (var i = 0; i < railsMarkers.length; i++) {
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(railsMarkers[i]["lat"], railsMarkers[i]["lng"]),
          map: map
        });
        markersArray.push(marker);
      };

};

function getMarkers() {
    var dynamicMarkers = [];


    $('*[data-id]').each(function(index) {
        var coordinate_pair = {};
        coordinate_pair["lat"]=($(this).data('latitude'));
        coordinate_pair["lng"]=($(this).data('longitude'));
        console.log(coordinate_pair);
        dynamicMarkers.push(coordinate_pair);
        });


        console.log(dynamicMarkers);
        return dynamicMarkers;
    };









