var map;
var markersArray = [];
var bounds = new google.maps.LatLngBounds();
var image = {
  url: 'http://res.cloudinary.com/djlrrh291/image/upload/v1481648518/mapsicon_hovifq.png',
  scaledSize: new google.maps.Size(20,20),
  origin: new google.maps.Point(0,0),
  anchor: new google.maps.Point(0,20)
};
var assets = gon.assets;

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



      // console.log(assets);


      for (var i = 0; i < railsMarkers.length; i++) {
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(railsMarkers[i]["lat"], railsMarkers[i]["lng"]),
          map: map,
          icon: image,
          title: (assets[i].price/1000).toString()
        });
        markersArray.push(marker);
        bounds.extend(marker.position);


        google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
            infoWindow.setContent('<div><p>'+assets[i].title+'</p><p>'+'Price: '+assets[i].price+'<br>'+assets[i].address+' '+assets[i].city+' '+assets[i].post_code+' '+assets[i].country+'</p></div>');
            infoWindow.open(map, marker);
          }
        })(marker, i));

      };

      map.fitBounds(bounds);

};

function removeMarkers() {
  // console.log(markersArray);
  for (var i = 0; i < markersArray.length; i++) {
    markersArray[i].setMap(null);
  }
  markersArray.length = 0;
  // console.log('Should be empty');
  // console.log(markersArray);
};



function addMarkers(railsMarkers) {

  var bounds_ajax = new google.maps.LatLngBounds();
  var infoWindow = new google.maps.InfoWindow({map: map});

      for (var i = 0; i < railsMarkers.length; i++) {
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(railsMarkers[i]["lat"], railsMarkers[i]["lng"]),
          map: map,
          icon: image,
          title: (assets[i].price/1000).toString()
        });
        markersArray.push(marker);
        bounds_ajax.extend(marker.position);

        google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
            infoWindow.setContent('<div><p>'+assets[i].title+'</p><p>'+'Price: '+assets[i].price+'<br>'+assets[i].address+' '+assets[i].city+' '+assets[i].post_code+' '+assets[i].country+'</p></div>');
            infoWindow.open(map, marker);
          }
        })(marker, i));
      };
        if (markersArray.length == 1) {
          console.log((markersArray.length));
          map.fitBounds(bounds_ajax);
          map.setZoom(14);
          map.setCenter(markerArray[i].position);
        } else {
        map.fitBounds(bounds_ajax);
      }
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


        // console.log(dynamicMarkers);
        return dynamicMarkers;
    };

function getOneMarker() {
  var oneMarker = [];
     $('*[data-id]').each(function(index) {
        var coordinate_pair = {};
        coordinate_pair["lat"]=($(this).data('latitude'));
        coordinate_pair["lng"]=($(this).data('longitude'));
        console.log(coordinate_pair);
        oneMarker.push(coordinate_pair);
        });


        // console.log(oneMarker);
        return oneMarker;
    };








