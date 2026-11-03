<?php
date_default_timezone_set('America/Los_Angeles');

// define variables and set to null values
$results = null;
$row = null;
$db = null;

//Security mod to prevent cross-site scripting attacks
  if (isset($_GET['tid'])){
	$TaxonID = $_GET['tid'];
	$TaxonID = htmlspecialchars($TaxonID);
	$TaxonID = str_replace(chr(0),"", $TaxonID);  #NULL BYTES
	$TaxonID = trim($TaxonID, $character_mask = "\s\t\n\r\0\x0B");
	$TaxonID = preg_replace("/[^0-9]/", "", $TaxonID);
  }
  else{
  	$TaxonID = null;
  }
  

  if(isset($_GET['tid'])){
  
	require '/eflora/config/config_eflora.php';
	//require 'config/config.php';
	$db = new SQLite3($database_location);
  }



date_default_timezone_set('America/Los_Angeles');

?>
<!DOCTYPE html>

<html lang="en"> 
<?php 
// TID is passed to JS by using PHP to echo the value of $TaxonID to a JS variable TaxID 
// Apparently there are better ways to do this

?>

<head>
<title><?php echo "$ScientificName"?></title>
<meta charset="UTF-8">
<meta name="description" content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords" content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="/common/css/dropdowns.css" rel="stylesheet" type="text/css" />
<link href="/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="/common/images/JepsonLogoSmall.png" type="image/x-icon" />

<!--jquery script files-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- leaflet maps files and scripts -->

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css"
   integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
   crossorigin=""/>
<link href='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/leaflet.fullscreen.css' rel='stylesheet' />

<script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js"
   integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg=="
   crossorigin=""></script>

<script src='https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/Leaflet.fullscreen.min.js'></script>

<script src='https://api.mapbox.com/mapbox.js/plugins/geojson-extent/v0.0.1/geojson-extent.js'></script>


<script type="text/javascript">
    var MapName = <?php echo json_encode($TaxonID); ?>; 
</script>

<style type="text/css" media="screen">

#ckboxes {	/* pushes checkbox a little from sidebar left edge */
	padding-left: 10px;
}

/* ID Styles */

/* eflora default table */
#EF_right table {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	margin: 5px;
	padding: 5px;
	width: 100%;
	border: none;
}


#EF_right tbody {
    vertical-align: top;
    border: none;
}


#EF_right tr {
    vertical-align: top;
    border: none;
}

#EF_right td{
	font-family: Verdana, Arial, Helvetica, sans-serif;
	vertical-align: top;
	border: none;
	width: 70%;
}


#EF_left table {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	margin: auto;
	width: 100%;
	border: none;
}


#EF_left tbody {
    vertical-align: top;
    border: none;
}


#EF_left tr {
    vertical-align: top;
    border: none;
	line-height: 1.5em;
}

#EF_left td{
	font-family: Verdana, Arial, Helvetica, sans-serif;
	vertical-align: top;
	border: none;
	width: 30%;
}


#EF_citation table {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	width: 100%;
	border: none;
	margin: auto;
}


#EF_citation tbody {
    vertical-align: top;
    border: none;
}


#EF_citation tr {
    vertical-align: top;
    border: none;
}

#EF_citation td{
	font-family: Verdana, Arial, Helvetica, sans-serif;
	vertical-align: top;
	border: none;
	width: 100%;
	margin: auto;
}



#EF_bottom table {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	margin: 5px;
	padding: 5px;
	width: 100%;
	border: none;
}


#EF_bottom tbody {
    vertical-align: top;
    border: none;
}


#EF_bottom tr {
    vertical-align: top;
    border: none;
}

#EF_bottom td{
	font-family: Verdana, Arial, Helvetica, sans-serif;
	vertical-align: top;
	border: none;
	width: 80%;
}

</style>



</head>

<body onload="initialize()">

<table >
	<tr><td>
<b><a name="EFMAP" id="EFMAP"></a>MAP CONTROLS</b>
<br />1. You can change the display of the base map layer control box in the upper right-hand corner.
<br />2. County and Jepson Region polygons can be turned off and on using the check boxes.
</td></tr>
<tr>
<td>
	<div id="map_canvas"></div>
	<link href="common/cluster/MarkerCluster.Default.css" type="text/css" rel=stylesheet />
	<link rel="stylesheet" type="text/css" href="common/cluster/MapkeyIcons.css" />
	<link rel="stylesheet" type="text/css" href="common/cluster/L.Icon.Mapkey.css" />
	<script src="common/cluster/L.Icon.Mapkey.js"></script>
	<script src="common/cluster/leaflet.markercluster.js"></script>


<script type="text/javascript"> 


latlng = L.latLng(37.5, -119.5);

var map = L.map('map_canvas', {
		center: latlng,
		zoom: 5
		});

	var jepsfill;
	var cntybnd;	
	var jepsreg;
	var geojsonLayerP;
	//var FILL = L.layerGroup();
	//var COUNTY = L.layerGroup();	
	var REG = L.layerGroup();
	
	map.scrollWheelZoom.disable();

var cacount = "counties_TIGER2016.geojson"; //full json file for California County TIGER2016 
var regfill = "JepsonV7.geojson"; //full json file for Jepson regions
var CABND = "CA_BND_line.geojson"; //full json file for California Boundary line file
var bnd = "Jepson_regions_buffer_bnd.geojson"; //full json file for Jepson regions


//$.getJSON('GEOJSON/'+MapName+'_2.geojson', function(data) { //March 2022
//$.getJSON('GEOJSON/'+MapName+'_3.geojson', function(data) { //Jan 2023
$.getJSON('GEOJSON/'+MapName+'_4.geojson', function(data) { //Feb 2023

	geojsonLayerP = L.geoJson(data, {
			// Make the popup
		pointToLayer: function (feature, latlng) {
			// Get the icon
			if (feature.properties.Flag_icon == 'Bmarker')
				return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: '#00008B', opacity:1,fillOpacity:1});
			else if (feature.properties.Flag_icon == 'Ymarker')
				return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: 'black', fillColor: 'yellow', opacity:1,fillOpacity:1});
			else if (feature.properties.Flag_icon == 'Pmarker')
				return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: '#9370DB', opacity:1,fillOpacity:1});
		}
	}).addTo(map);

		
  map.on('zoomend', function() {
	var currentZoom = map.getZoom();
	
	  if (currentZoom <= 5) {

		geojsonLayerP = L.geoJson(data, {
			// Make the popup
			pointToLayer: function (feature, latlng) {
// Get the icon
				if (feature.properties.Flag_icon == 'Bmarker')
					return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: 'black', fillColor: '#00008B', opacity:1,fillOpacity:1});
				else if (feature.properties.Flag_icon == 'Ymarker')
					return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: 'black', fillColor: 'yellow', opacity:1,fillOpacity:1});
				else if (feature.properties.Flag_icon == 'Pmarker')
					return L.circleMarker(latlng, {stroke:true, radius: 3, weight: 1, color: '#9370DB', opacity:1,fillOpacity:1});
		}
	  }).addTo(map);
	}
	else{
	
		if (currentZoom <= 6) {

			geojsonLayerP = L.geoJson(data, {
			// Make the popup
				pointToLayer: function (feature, latlng) {
// Get the icon
					if (feature.properties.Flag_icon == 'Bmarker')
						return L.circleMarker(latlng, {stroke:true, radius: 6, weight: 2, color: 'black', fillColor: '#00008B', opacity:1,fillOpacity:1});
					else if (feature.properties.Flag_icon == 'Ymarker')
						return L.circleMarker(latlng, {stroke:true, radius: 6, weight: 2, color: 'black', fillColor: 'yellow', opacity:1,fillOpacity:1});
					else if (feature.properties.Flag_icon == 'Pmarker')
						return L.circleMarker(latlng, {stroke:true, radius: 6, weight: 2, color: '#9370DB', opacity:1,fillOpacity:1});

					//return L.marker(latlng, {
					//	icon:L.icon({
					//		iconUrl: 'common/icons/'+feature.properties.Flag_icon+'S.png',
					//		iconSize: [10,10],
					//		popupAnchor: [1, -25],    // point of the icon which will correspond to popup's location
					//		iconAnchor: [2, 8]   // point of the icon which will correspond to marker's location
					//	})
					//});
				}
			}).addTo(map);

		}
		else {
			if (currentZoom <= 7) {

				geojsonLayerP = L.geoJson(data, {
			// Make the popup
					onEachFeature: function (feature, layer) {
			         layer.bindPopup(feature.properties.det_name+"<br /><a href=/consortium/details.php?aid="+feature.properties.accid+">"+feature.properties.accid+"</a>");
					},
					pointToLayer: function (feature, latlng) {
			// Get the icon
						return L.marker(latlng, {
							icon:L.icon({
								iconUrl: 'common/icons/'+feature.properties.Flag_icon+'.png',
								iconSize: [14,14],
								popupAnchor: [1, -15],    // point of the icon which will correspond to popup's location
								iconAnchor: [7, 14]   // point of the icon which will correspond to marker's location
							})
						});
					}
				}).addTo(map);

			}
			else {
				if (currentZoom <= 9) {

					geojsonLayerP = L.geoJson(data, {
					// Make the popup
						onEachFeature: function (feature, layer) {
				         layer.bindPopup(feature.properties.det_name+"<br /><a href=/consortium/details.php?aid="+feature.properties.accid+">"+feature.properties.accid+"</a>");
						},
						pointToLayer: function (feature, latlng) {
			// Get the icon
							return L.marker(latlng, {
								icon:L.icon({
									iconUrl: 'common/icons/'+feature.properties.Flag_icon+'.png',
									iconSize: [20,20],
									popupAnchor: [1, -25],    // point of the icon which will correspond to popup's location
									iconAnchor: [10, 20]   // point of the icon which will correspond to marker's location
								})
							});
						}
					}).addTo(map);

				}
				else{

					geojsonLayerP = L.geoJson(data, {
						// Make the popup
						onEachFeature: function (feature, layer) {
				         layer.bindPopup(feature.properties.det_name+"<br /><a href=/consortium/details.php?aid="+feature.properties.accid+">"+feature.properties.accid+"</a>");
						},
						pointToLayer: function (feature, latlng) {
						// Get the icon
							return L.marker(latlng, {
								icon:L.icon({
									iconUrl: 'common/icons/'+feature.properties.Flag_icon+'.png',
									iconSize: [30,30],
									popupAnchor: [1, -25],    // point of the icon which will correspond to popup's location
									iconAnchor: [15, 30]   // point of the icon which will correspond to marker's location
								})
							});
						}
					}).addTo(map);

				}
			}
		}
	  }
  });


  map.on('zoomstart', function() {

		map.eachLayer(function(layer) {
			if (map.hasLayer(geojsonLayerP)) {
				map.removeLayer(geojsonLayerP);
			}
			//if (this.checked) { map.addLayer(layer); }
//else { map.removeLayer(layer); }
			//if( layer instanceof L.GeoJSON ) {
			//	map.removeLayer(layer);
				
			//}

		});
  });


});

// loading GeoJSON file - files resides in same folder
$.getJSON(cacount ,function(data){
// L.geoJson function is used to parse geojson file and load on to map
  cntybnd = L.geoJson(data, {
	style: function(feature) {
		switch (feature.properties.NAME) {
		case 'San Luis Obispo': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Glenn': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Santa Cruz': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Siskiyou': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'San Mateo': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Plumas': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Lake': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Amador': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Sutter': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Imperial': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Orange': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Stanislaus': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Tulare': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Merced': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Butte': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Nevada': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Alameda': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'San Joaquin': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Santa Clara': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Tehama': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Madera': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Fresno': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Del Norte': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Modoc': return {
				color: "#00000f",
				weight: 1,
				opacity: 1,
				fill: false
			};
		case 'Colusa': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: false
			};
		case 'Kern': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Riverside': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Humboldt': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'San Benito': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Yuba': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Yolo': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'El Dorado': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Alpine': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Contra Costa': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'San Bernardino': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Solano': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Tuolumne': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Mono': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Inyo': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Mendocino': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Trinity': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Monterey': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Shasta': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Napa': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Lassen': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Mariposa': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Marin': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'San Francisco': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Placer': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'San Diego': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Kings': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Calaveras': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Ventura': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Los Angeles': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Sonoma': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Santa Barbara': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Sacramento': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
		case 'Sierra': return {
				color: "#00000f",
				weight: 2,
				opacity: 1,
				fill: false
			};
        }
    }
	});
});



// loading GeoJSON file - files resides in same folder
$.getJSON(regfill ,function(data){
// L.geoJson function is used to parse geojson file and load on to map
  jepsfill = L.geoJson(data, {
	style: function(feature) {
		switch (feature.properties.JEPCODE) {
		case 'Wrn': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#ffa500",
				fillOpacity: 0.7
			};
		case 'MP': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#ecdea0",
				fillOpacity: 0.7
			};
		case 'KR': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#637c36",
				fillOpacity: 0.7
			};
		case 'CaRF': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#c2deac",
				fillOpacity: 0.7
			};
		case 'CaRH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#618800",
				fillOpacity: 0.7
			};
		case 'NCo': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#006400",
				fillOpacity: 0.7
			};
		case 'NCoRI': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#89cc9f",
				fillOpacity: 0.7
			};
		case 'NCoRO': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#89cca9",
				fillOpacity: 0.7
			};
		case 'NCoRH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#89cc95",
				fillOpacity: 0.7
			};
		case 'ScV': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#9acd32",
				fillOpacity: 0.7
			};
		case 'SnJV': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#d7ff86",
				fillOpacity: 0.7
			};
		case 'CCo': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#609a83",
				fillOpacity: 0.7
			};
		case 'SCoRO': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#6dd4c3",
				fillOpacity: 0.7
			};
		case 'SCoRI': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#6dd4b9",
				fillOpacity: 0.7
			};
		case 'SCo': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#9b30ff",
				fillOpacity: 0.7
			};
		case 'SnFrB': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#d1feed",
				fillOpacity: 0.7
			};
		case 'Teh': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#b1c5de",
				fillOpacity: 0.7
			};
		case 'nSNF': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#98c0ed",
				fillOpacity: 0.7
			};
		case 'cSNF': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#98c0f7",
				fillOpacity: 0.7
			};
		case 'sSNF': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#98c0ff",
				fillOpacity: 0.7
			};
		case 'nSNH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#4ebeea",
				fillOpacity: 0.7
			};
		case 'cSNH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#4ebef4",
				fillOpacity: 0.7
			};
		case 'sSNH': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#4ebefe",
				fillOpacity: 0.7
			};
		case 'SNE': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#e7ee06",
				fillOpacity: 0.7
			};
		case 'W&I': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#c6b247",
				fillOpacity: 0.7
			};
		case 'DMoj': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#fbf0c0",
				fillOpacity: 0.7
			};
		case 'DMtns': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#ff640d",
				fillOpacity: 0.7
			};
		case 'DSon': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#ebd864",
				fillOpacity: 0.7
			};
		case 'PR': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#cf7ba9",
				fillOpacity: 0.7
			};
		case 'SnJt': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#cf7bbd",
				fillOpacity: 0.7
			};
		case 'nChI': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#dda0dd",
				fillOpacity: 0.7
			};
		case 'sChI': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#dda0d3",
				fillOpacity: 0.7
			};
		case 'WTR': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#eccaeb",
				fillOpacity: 0.7
			};
		case 'SnGb': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#eccaf5",
				fillOpacity: 0.7
			};
		case 'SnBr': return {
				color: "#00000f",
				weight: 0.5,
				opacity: 0.1,
				fill: true,
				fillColor: "#eccaff",
				fillOpacity: 0.7
			};
        }
    }
	});
});


// loading GeoJSON file
$.getJSON(bnd ,function(data){
// L.geoJson function is used to parse geojson file and load on to map
  jepsreg = L.geoJson(data, {
	style: function(feature) {
		switch (feature.properties.JEPCODE) {
		case 'Wrn': return {
				color: "#ffa500",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#ffa500",
				fillOpacity: 0.8
			};
		case 'MP': return {
				color: "#ecdea0",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#ecdea0",
				fillOpacity: 0.8
			};
		case 'KR': return {
				color: "#637c36",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#637c36",
				fillOpacity: 0.8
			};
		case 'CaRF': return {
				color: "#c2deac",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#c2deac",
				fillOpacity: 0.8
			};
		case 'CaRH': return {
				color: "#618800",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#618800",
				fillOpacity: 0.8
			};
		case 'NCo': return {
				color: "#006400",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#006400",
				fillOpacity: 0.8
			};
		case 'NCoRI': return {
				color: "#89cc9f",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#89cc9f",
				fillOpacity: 0.8
			};
		case 'NCoRO': return {
				color: "#89cca9",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#89cca9",
				fillOpacity: 0.8
			};
		case 'NCoRH': return {
				color: "#89cc95",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#89cc95",
				fillOpacity: 0.8
			};
		case 'ScV': return {
				color: "#9acd32",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#9acd32",
				fillOpacity: 0.8
			};
		case 'SnJV': return {
				color: "#d7ff86",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#d7ff86",
				fillOpacity: 0.8
			};
		case 'CCo': return {
				color: "#609a83",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#609a83",
				fillOpacity: 0.8
			};
		case 'SCoRO': return {
				color: "#6dd4c3",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#6dd4c3",
				fillOpacity: 0.8
			};
		case 'SCoRI': return {
				color: "#6dd4b9",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#6dd4b9",
				fillOpacity: 0.8
			};
		case 'SCo': return {
				color: "#9b30ff",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#9b30ff",
				fillOpacity: 0.8
			};
		case 'SnFrB': return {
				color: "#d1feed",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#d1feed",
				fillOpacity: 0.8
			};
		case 'Teh': return {
				color: "#b1c5de",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#b1c5de",
				fillOpacity: 0.8
			};
		case 'nSNF': return {
				color: "#98c0ed",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#98c0ed",
				fillOpacity: 0.8
			};
		case 'cSNF': return {
				color: "#98c0f7",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#98c0f7",
				fillOpacity: 0.8
			};
		case 'sSNF': return {
				color: "#98c0ff",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#98c0ff",
				fillOpacity: 0.8
			};
		case 'nSNH': return {
				color: "#4ebeea",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#4ebeea",
				fillOpacity: 0.8
			};
		case 'cSNH': return {
				color: "#4ebef4",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#4ebef4",
				fillOpacity: 0.8
			};
		case 'sSNH': return {
				color: "#4ebefe",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#4ebefe",
				fillOpacity: 0.8
			};
		case 'SNE': return {
				color: "#e7ee06",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#e7ee06",
				fillOpacity: 0.8
			};
		case 'W&I': return {
				color: "#c6b247",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#c6b247",
				fillOpacity: 0.8
			};
		case 'DMoj': return {
				color: "#fbf0c0",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#fbf0c0",
				fillOpacity: 0.8
			};
		case 'DMtns': return {
				color: "#ff640d",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#ff640d",
				fillOpacity: 0.8
			};
		case 'DSon': return {
				color: "#ebd864",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#ebd864",
				fillOpacity: 0.8
			};
		case 'PR': return {
				color: "#cf7ba9",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#cf7ba9",
				fillOpacity: 0.8
			};
		case 'SnJt': return {
				color: "#cf7bbd",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#cf7bbd",
				fillOpacity: 0.8
			};
		case 'nChI': return {
				color: "#dda0dd",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#dda0dd",
				fillOpacity: 0.8
			};
		case 'sChI': return {
				color: "#dda0d3",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#dda0d3",
				fillOpacity: 0.8
			};
		case 'WTR': return {
				color: "#eccaeb",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#eccaeb",
				fillOpacity: 0.8
			};
		case 'SnGb': return {
				color: "#eccaf5",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#eccaf5",
				fillOpacity: 0.8
			};
		case 'SnBr': return {
				color: "#eccaff",
				weight: 0.5,
				opacity: 0.8,
				fill: true,
				fillColor: "#eccaff",
				fillOpacity: 0.8
			};
        }
    }
  }).addTo(REG);

});


$.getJSON(CABND ,function(data){
// L.geoJson function is used to parse geojson file and load on to map


//  map.on('load', function() {
	L.geoJson(data, {
		style: function(feature) {
			switch (feature.properties.STATEFP) {
			case 'CA': return {
					color: "#00000f",
					weight: 1,
					opacity: 0.5,
					fill: false
				};
	        }
	    }
	}).addTo(map);
//  });

  map.on('zoom', function() {

   L.geoJson(data, {
		style: function(feature) {
			switch (feature.properties.STATEFP) {
			case 'CA': return {
					color: "#00000f",
					weight: 2,
					opacity: 0.5,
					fill: false
				};
	        }
	    }
	}).addTo(map);
  });


});



	// Adding open source layers, unlimited loads
	var streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
		attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
		type: 'streets'
	});


	var satellite = L.tileLayer(
	'https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
		attribution: '&copy; Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
		maxNativeZoom: 19,
		maxZoom: 25,
		opacity: 0.8
	}).addTo(map);

	var baseMaps = {
		"Streets": streets,
		"Satellite": satellite
	};
	
	var overlay = {
		"Add Jepson regions": REG,
		//"Fill Jepson regions": FILL,
		//"Add County Boundaries": COUNTY
	};

//"County boundaries": county
	L.control.layers(baseMaps, overlay).addTo(map);
	//L.control.layers(baseMaps).addTo(map);


  map.on('click', function() {

   L.geoJson(data, {
		style: function(feature) {
			switch (feature.properties.STATEFP) {
			case 'CA': return {
					color: "#00000f",
					weight: 2,
					opacity: 0.5,
					fill: false
				};
	        }
	    }
	}).addTo(map);
  });




</script>


</td>
</tr>


<tr>
<td valign="top">Data provided by the participants of the&nbsp;
<?php echo '<a href="/consortium/about.html">Consortium of California Herbaria</a>'?>.
<br /><b>MAP LEGEND</b>
<br />
<?php //echo '<a href="/cgi-bin/get_consort.pl?taxon_name='.$hb_name.'">View all CCH records</a>'

echo '<a href="/consortium/list.php?taxon_name='.$hb_name.'"">View all CCH records</a>'

?>
<br />All markers link to CCH specimen records. The original determination is shown in the popup window.
<br />Blue markers indicate specimens that map to one of the expected Jepson geographic subdivisions (see left map). Purple markers indicate specimens collected from a garden, greenhouse, or other non-wild location.
<br />Yellow markers indicate records that may provide evidence for eFlora range revision or may have georeferencing or identification issues.
<br /><b><a href="/consortium/about_yellow.html">READ ABOUT YELLOW FLAGS</a></b>
<br /><br /><br />

</td></tr>
</table>

</div>

		</td>
	</tr>
	</table> <!--close efSide table-->
<!--begin footer-->
<?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/eflora_footer.php'); ?>
<!--end footer-->

	</div>
   </td>
  </tr>
</table> <!--close content table-->
  

 
 	</td>
   <td class="spacer1"><img src="/common/images/common_spacer.gif" alt="" style="height:1px;width:5px;"></td>
  </tr>
 </table> <!--close outside normal table-->


</body>
</html>
