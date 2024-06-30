<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" href="Home.css">
<link rel="icon" href="images/favicon.ico">
<script src="Home.js" defer></script>
<script src="https://kit.fontawesome.com/2e138218ab.js" crossorigin="anonymous"></script> 
</head>
<body>
  <div class="container">
     <div class="header">
        <h2>Taapmaan</h2>
        <div class="weather-input">
          <input type="text" name="city" id="city_input" placeholder="Enter city or coordinates">
          <button type="button" id="searchBtn">
           <i class="fa-solid fa-magnifying-glass"></i></i> Search
          </button>
          <button type="button" id="locationBtn">
           <i class="fa-solid fa-location-crosshairs"></i> Current Location
          </button>
        </div>
     </div>
     <div class="weather-data">
       <div class="weather-left">
       <div class="card">
       <div class="current-weather">
       <div class="details">
       <p>Now</p>
       <h2>___&deg;C</h2>
       <p>________</p>
       </div>
       <div class="weather-icon">
       <img src="https://openweathermap.org/img/wn/04d@2x.png">
       </div>
       </div>
       <div class="card-footer">
        <p><i class="fa-regular fa-calendar"></i></i>_______</p>
        <p><i class="fa-solid fa-location-crosshairs"></i>_______</p>
       </div>
       </div>
       <div class="card">
       <h2>5 days Forecast</h2>
       <div class="day-forecast">
       <div class="forecast-item">
       <div class="icon-wrapper">
        <img src="https://openweathermap.org/img/wn/02d.png">
        <span>___&deg;C</span>
       </div>
       <p>_____</p>
       <p>_____</p>
       </div>
       </div>
       
       <div class="day-forecast">
       <div class="forecast-item">
       <div class="icon-wrapper">
        <img src="https://openweathermap.org/img/wn/02d.png">
        <span>___&deg;C</span>
       </div>
       <p>_____</p>
       <p>_____</p>
       </div>
       </div>
       
       <div class="day-forecast">
       <div class="forecast-item">
       <div class="icon-wrapper">
        <img src="https://openweathermap.org/img/wn/02d.png">
        <span>___&deg;C</span>
       </div>
       <p>_____</p>
       <p>_____</p>
       </div>
       </div>
       
       <div class="day-forecast">
       <div class="forecast-item">
       <div class="icon-wrapper">
        <img src="https://openweathermap.org/img/wn/02d.png">
        <span>___&deg;C</span>
       </div>
       <p>_____</p>
       <p>_____</p>
       </div>
       </div>
       
       <div class="day-forecast">
       <div class="forecast-item">
       <div class="icon-wrapper">
        <img src="https://openweathermap.org/img/wn/02d.png">
        <span>___&deg;C</span>
       </div>
       <p>_____</p>
       <p>_____</p>
       </div>
       </div>
       </div>
     </div>
     <div class="weather-right">
     <h2>Today's Highlights</h2>
     <div class="highlights">
     
     <div class="card">
     <div class="card-head">
     <p>Air Quality Index</p>
     <p class="air-index aqi-1">Good</p>
     </div>
     </div>
     
     <div class="card">
     <div class="card-head">
     <p>Air Quality Index</p>
     <p class="air-index aqi-2">Good</p>
     </div>
     </div>
     
     <div class="card">
     <div class="card-head">
     <p>Air Quality Index</p>
     <p class="air-index aqi-3">Good</p>
     </div>
     </div>
     
     <div class="card">
     <div class="card-head">
     <p>Air Quality Index</p>
     <p class="air-index aqi-4">Good</p>
     </div>
     </div>
     
     <div class="card">
     <div class="card-head">
     <p>Air Quality Index</p>
     <p class="air-index aqi-5">Good</p>
     </div>
     
     <div class="air-indices">
     <i class="fa-solid fa-wind"></i>
     
     <div class="item">
     <p>PM2.5</p>
     <h2>__________</h2>
     </div>
     
     <div class="item">
     <p>PM10</p>
     <h2>__________</h2>
     </div>
     
     <div class="item">
     <p>SO2</p>
     <h2>__________</h2>
     </div>
     
     <div class="item">
     <p>CO</p>
     <h2>__________</h2>
     </div>
     
     <div class="item">
     <p>NO</p>
     <h2>__________</h2>
     
     <div class="item">
     <p>NO2</p>
     <h2>__________</h2>
     
     <div class="item">
     <p>NH3</p>
     <h2>__________</h2>
     
     <div class="item">
     <p>O3</p>
     <h2>__________</h2>
     </div>
     </div>
     </div>
     
     <div class="card">
     <div class="card-head">
     <p>Sunrise & Sunset</p>
     </div>
     <div class="sunrise-sunset">
      <div class="item">
      <div class="icon">
      <i class="fa-regular fa-sun"></i>
      </div>
      <p>Sunrise</p>
      <h2>_____</h2>
      </div>
      
      <div class="item">
      <div class="icon">
      <i class="fa-regular fa-sun"></i>
      </div>
      <p>Sunset</p>
      <h2>_____</h2>
      </div>
     </div>
     </div>
     </div>
     <div class="card">
     <div class="card-head">
     <p>Humidity</p>
     </div>
     
     <div class="card-item">
      <i class="fa-sharp fa-solid fa-droplet"></i>
      <h2 id="humidityVal">_______%</h2>
     </div>
     </div>
     
     <div class="card">
     <div class="card-head">
     <p>Pressure</p>
     </div>
     
     <div class="card-item">
      <i class="fa-sharp fa-solid fa-compass"></i>
      <h2 id="pressureVal">_______hPa</h2>
     </div>
     </div>
     
      <div class="card">
     <div class="card-head">
     <p>Visibility</p>
     </div>
     
     <div class="card-item">
      <i class="fa-sharp fa-solid fa-eye"></i>
      <h2 id="visibilityVal">_______km</h2>
     </div>
     </div>
     
      <div class="card">
     <div class="card-head">
     <p>Wind Speed</p>
     </div>
     
     <div class="card-item">
      <i class="fa-sharp fa-solid fa-location-arrow"></i>
      <h2 id="windSpeedVal">_______m/s</h2>
     </div>
     </div>
     
      <div class="card">
     <div class="card-head">
     <p>Feels Like</p>
     </div>
     
     <div class="card-item">
      <i class="fa-sharp fa-solid fa-temperature-list"></i>
      <h2 id="humidityVal">_______%</h2>
     </div>
     </div>
     </div>
   </div>
</body>
</html>