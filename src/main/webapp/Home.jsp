<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="Home.css?v=1.0">
<link rel="icon" href="images/favicon.ico">
<script src="Home.js" defer></script>
<script src="https://kit.fontawesome.com/2e138218ab.js" crossorigin="anonymous"></script>
</head>
<body>

<%
if(session.getAttribute("name")==null)
       {
	response.sendRedirect("Login.jsp");
	         }
%>

<div class="weather-app">

  <div class="container">
    <h3 class="brand">Taapmaan</h3>
    
   
    <div class="temperature" >
      <h1 class="temp"> </h1>
      <div class="city-time">
        <h1 class="name" id="temperature"> </h1>
        <h1 class="name" id="cityname"> </h1>
      </div>
    
      <div class="weather">
        <!--<img alt="icon" src="weather_conditions.json" class="icon" width="50" height="50">-->
        
        <span class="conditions" id= "condition"> </span>
      </div>
    </div>
  </div>
  <div class="panel">
      <input type="text" class="search" placeholder="Search Location..." id="cityinput">
      <button class="submit" onclick="getWeatherByCityName()">
        <i class="fas fa-search"></i>
      </button>
      
<!--       <div> -->
<!-- 	  		<input type="text" class="search" placeholder="Enter Latitude..." id="latInput"> -->
<!-- 	  		<input type="text" class="search" placeholder="Enter Longitude..." id="lonInput"> -->
<!-- 	      <button class="submit" onclick="getWeatherByLatLon()"> -->
<!-- 	        <i class="fas fa-search"></i> -->
<!-- 	      </button> -->
<!-- 	  </div> -->

      <div id="weatherInfo"></div>
    <ul class="cities">
      <li class="city">Jodhpur</li>
      <li class="city">Udaipur</li>
      <li class="city">Ajmer</li>
      <li class="city">Delhi</li>
      <li class="city">Jaisalmer</li>
    </ul>
  
    <ul class="details">
      <h4>Weather Details</h4>
      <li>
        <span>Humidity</span>
        <span class="cloud" id="humidity"> </span>
      </li>
    
      <li>
        <span>Wind</span>
        <span class="cloud" id="wind"> </span>
      </li>
      
       <li>
        <span>Last Updated</span>
        <span class="cloud" id="lastupdated"> </span>
      </li>
    </ul>
  </div>
</div>

</body>
</html>
