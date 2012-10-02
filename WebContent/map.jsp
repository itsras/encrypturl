<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Map</title>
<script type="text/javascript" language="Javascript" src="http://maps.google.com/maps/api/js?sensor=false&.js"></script>
<script type='text/javascript' src="http://code.jquery.com/jquery-1.4.2.js"></script>
<script type="text/javascript" src="http://jsfiddle.net/js/lib/jquery.lint.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.4/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
var map;
var elevator;
var myOptions = {
    zoom: 6,
    center: new google.maps.LatLng(46.87916, -3.32910),
    mapTypeId: 'terrain'
};
map = new google.maps.Map($('#map')[0], myOptions);
var markers = [];

// Add a listener for idle event and call getElevation on a random set of marker in the bound
google.maps.event.addListener(map, 'idle', function()
{
    // Create an ElevationService
    elevator = new google.maps.ElevationService();
    $.each(markers, function(key, value)
    {
        value.setMap(null);
    });
    // getting bounds of current location
    var boundBox = map.getBounds();
    var southWest = boundBox.getSouthWest();
    var northEast = boundBox.getNorthEast();
    var lngSpan = northEast.lng() - southWest.lng();
    var latSpan = northEast.lat() - southWest.lat();
    // adding 20 markers to the map at random locations
    var locations = [];
    for (var j = 0; j < 10; j++)
    {
        var location = new google.maps.LatLng(
                southWest.lat() + latSpan * Math.random(),
                southWest.lng() + lngSpan * Math.random()
                );
        locations.push(location);
    }

    // Create a LocationElevationRequest object using the array's one value
    var positionalRequest = {
        'locations': locations
    };

    elevator.getElevationForLocations(positionalRequest, function(results, status)
    {
        if (status === google.maps.ElevationStatus.OK)
        {
            $.each(results, function(key, value)
            {
                if (value.elevation < 0)
                {
                    markers[key] = new google.maps.Marker({
                        position: value.location,
                        map: map,
                        icon: 'http://google-maps-icons.googlecode.com/files/sailboat-tourism.png'
                    });
                }
                else
                {
                    markers[key] = new google.maps.Marker({
                        position: value.location,
                        map: map,
                        icon: 'http://google-maps-icons.googlecode.com/files/red' + ('0' + key.toString()).slice(-2) + '.png'
                    });
                }
            });
        }
    });
});
});
</script>

  <link rel="stylesheet" type="text/css" href="http://jsfiddle.net/css/normalize.css"/>
  <link rel="stylesheet" type="text/css" href="http://jsfiddle.net/css/result-light.css"/>
  
<style type="text/css">
#map{
    width: 450px;
    height: 400px;
}
</style>
</head>
<body>
World Map
<div id="map"></div>
</body>
</html>