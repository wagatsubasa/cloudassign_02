<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<script
    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
  
var map;
function initialize() {
     var latlng = new google.maps.LatLng(1.290577, 103.851619);
  var mapOptions = {
    zoom: 8,
    center: latlng
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
      
 var marker = new google.maps.Marker({
      position: latlng, 
      map: map, 
      title:"National Gallery Singapore"
    });      
    
}
google.maps.event.addDomListener(window, 'load', initialize);

function displayRoute() {

    var start = new google.maps.LatLng(1.382310, 103.739149); 
    var end = new google.maps.LatLng(1.279856, 103.834935);

    var directionsDisplay = new google.maps.DirectionsRenderer();// also, constructor can get "DirectionsRendererOptions" object
    directionsDisplay.setMap(map); // map should be already initialized.
    
     directionsDisplay.setPanel(document.getElementById('right-panel'));

    var request = {
        origin : start,
        destination : end,
        travelMode : google.maps.TravelMode.DRIVING
    };
    var directionsService = new google.maps.DirectionsService(); 
    directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
            
        }
    });
}

</script>
<body>
	<div id="header">
		<div>
			<a href="index.jsp" class="logo">
			<h1>Pioneer Care</h1>
			</a> <span>Emergency Contact<b>8-234-354-210</b></span>
		</div>
		<ul>
			<li>
				<a href="index.jsp">Home</a>
			</li>
			
			<li>
				<a href="ElderTime.jsp">Dashboard</a>
			<li class="selected">
				<a href="direction.jsp">Best Route</a>
			</li>
			<li>
				<a href="notify_driver.jsp">Traffic Alert</a>
			</li>
		</ul>
	</div>
	<div id="body">
		<div class="content">
                    
                    
                    
			 
                    <form>
				<label for="start"> <span>Start :</span>
					<input type="text" name="start" id="start">
				</label>
				<label for="end"> <span>End :</span>
					<input type="text" name="end" id="end">
				</label>
				
				<br/>
                                <button type="button" id="send" onclick="displayRoute()">Display Direction</button> 
                    </form>	
                
                    <div class="footer">
                        <h3>Best Route</h3>
                     <div id="map-canvas" style="height:300px; width:500px"></div>
 
                     <div id="right-panel"></div>
                    </div>
		</div>
	</div>
	<div id="footer">
		<ul>
			<li id="twitter">
				<a href="http://freewebsitetemplates.com/go/twitter/">twitter</a>
			</li>
			<li id="facebook">
				<a href="http://freewebsitetemplates.com/go/facebook/">facebook</a>
			</li>
			<li id="googleplus">
				<a href="http://freewebsitetemplates.com/go/googleplus/">googleplus</a>
			</li>
		</ul>
		<p>
			&copy; Copyright 2012. All rights reserved.
		</p>
	</div>
</body>
</html>