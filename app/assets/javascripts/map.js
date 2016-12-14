var map;
var markersArray = [];
var bounds = new google.maps.LatLngBounds();
var image = {
  url: 'http://res.cloudinary.com/djlrrh291/image/upload/v1481650186/mapsicon2_n01dof.png',
  scaledSize: new google.maps.Size(30,30),
  origin: new google.maps.Point(0,0),
  anchor: new google.maps.Point(0,20)
};
var assets = gon.assets;
var infoWindow = new google.maps.InfoWindow({map: map});
var asset = gon.asset;


function initMap(railsMarkers) {
          map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 0, lng: 0},
          zoom: 6
        });


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
  for (var i = 0; i < markersArray.length; i++) {
    markersArray[i].setMap(null);
  }
  markersArray.length = 0;
};



function addMarkers(railsMarkers) {

  var bounds_ajax = new google.maps.LatLngBounds();
  // var infoWindow = new google.maps.InfoWindow({map: map});


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
          map.fitBounds(bounds_ajax);
          map.setZoom(14);
          map.setCenter(markersArray[i].position);
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

        dynamicMarkers.push(coordinate_pair);
        });

        return dynamicMarkers;
    };

function getOneMarker() {
  var oneMarker = [];
     $('*[data-id]').each(function(index) {
        var coordinate_pair = {};
        coordinate_pair["lat"]=($(this).data('latitude'));
        coordinate_pair["lng"]=($(this).data('longitude'));
        oneMarker.push(coordinate_pair);
        });

        return oneMarker;
    };

function initMapIndividual(railsMarkers) {
 map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 0, lng: 0},
          zoom: 14
        });


      for (var i = 0; i < railsMarkers.length; i++) {
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(railsMarkers[i]["lat"], railsMarkers[i]["lng"]),
          map: map,
          icon: image,
          title: (asset.price/1000).toString()
        });
        markersArray.push(marker);
        bounds.extend(marker.position);


        google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
            infoWindow.setContent('<div><p>'+asset.title+'</p><p>'+'Price: '+asset.price+'<br>'+asset.address+' '+asset.city+' '+asset.post_code+' '+asset.country+'</p></div>');
            infoWindow.open(map, marker);
          }
        })(marker, i));

      };
      map.setCenter(markersArray[0].position);
      map.setZoom(14);

}




