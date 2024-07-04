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
  <div class="menu"><i class="fa-solid fa-bars"></i></div>
        <div class="dropdown">
          <ul class="dropdown-menu">
            <li class="dropdown-item" id="search-coordinates">Search with Latitude and Longitude</li>
            <li class="dropdown-item" id="search-custom-date">Search Average Temperature Custom Date</li>
            <li class="dropdown-item" id="logout"><a href="Login.jsp">Logout</a></li>
          </ul>
        </div>
        <h3 class="brand">Taapmaan</h3>
      </div>
      
      <div id="coordinateSearch" class="hidden search-form">
        <form id="coordinateInput">
        <div class="coords">
          <input type="text" class="search" placeholder="Latitude" id="latInput" />
        </div>
        <div class="coords">
          <input type="text" class="search" placeholder="Longitude" id="lonInput" />
          <button type="submit" class="submit" onClick="getWeatherByLatLon()">
          <i class="fas fa-search"></i>
          </button>
        </div>
        </form>     
      </div>
      
      <div id="customDateSearch" class="hidden search-form">
        <form id="customDateInput">
          <input type="date" class="search" id="startDate" />
          <input type="date" class="search" id="endDate" />
          <select class="avgCity" id="avgCity">
          <option value="Jaipur">Jaipur</option>
          <option value="Pune">Pune</option>
          <option value="Mumbai">Mumbai</option>
          <option value="Delhi">Delhi</option>
          </select>
          <button type="submit" class="submit" onClick="CalculateAverage()">Search</button>
        </form>
        <div id="averageResult" class="averageResult"></div>
      </div>

    <div class="temperature" >
      <h1 class="temp"> </h1>
      <div class="city-time">
        <h1 class="name" id="temperature"> </h1>
        <h1 class="name" id="cityname"> </h1>
      </div>
    
      <div class="weather">
        <span class="conditions" id= "condition"> </span>
      </div>
    </div>
  </div>
  
  <div class="panel">
      <input type="text" class="search" placeholder="Search Location..." id="cityinput">
      <button class="submit" onclick="getWeatherByCityName()">
        <i class="fas fa-search"></i>
      </button>

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
