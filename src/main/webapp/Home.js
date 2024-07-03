document.addEventListener('DOMContentLoaded', () => {
    console.log('DOM fully loaded and parsed');
    
    const menuIcon = document.querySelector('.menu');
    const dropdownMenu = document.querySelector('.dropdown-menu');
    const searchCoordinates = document.getElementById('search-coordinates');
    const searchCustomDate = document.getElementById('search-custom-date');
    const coordinateSearch = document.getElementById('coordinateSearch');
    const customDateSearch = document.getElementById('customDateSearch');
    const logout = document.getElementById('logout');
    
    menuIcon.addEventListener('click', () => {
        dropdownMenu.classList.toggle('show');
    });
    
    searchCoordinates.addEventListener('click', () => {
        coordinateSearch.classList.toggle('hidden');
        customDateSearch.classList.add('hidden');
        dropdownMenu.classList.remove('show');
        if (!coordinateSearch.classList.contains('hidden')) {
            document.getElementById('latInput').focus();
        }
    });
    
    searchCustomDate.addEventListener('click', () => {
        customDateSearch.classList.toggle('hidden');
        coordinateSearch.classList.add('hidden');
        dropdownMenu.classList.remove('show');
        if (!customDateSearch.classList.contains('hidden')) {
            document.getElementById('startDate').focus();
        }
    });
    
    logout.addEventListener('click', () => {
        console.log('Logout clicked');
        // Implement logout functionality here
    });
});

function getWeatherByCityName() {
    const apiKey = '38370608b7254b4dbe534835240207';
    const cityInput = document.getElementById('cityinput').value;
    const apiUrl = `http://api.weatherapi.com/v1/current.json?key=${apiKey}&q=${cityInput}`;

    fetch(apiUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            displayWeather(data);
        })
        .catch(error => {
            document.getElementById('weatherInfo').innerText = 'Error: ' + error.message;
        });
}

function getWeatherByLatLon() {
    const apiKey = '38370608b7254b4dbe534835240207';
    const lat = document.getElementById('latInput').value;
    const lon = document.getElementById('lonInput').value;
    const apiUrl = `http://api.weatherapi.com/v1/current.json?key=${apiKey}&q=${lat},${lon}`;

    fetch(apiUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            displayWeather(data);
        })
        .catch(error => {
            document.getElementById('weatherInfo').innerText = 'Error: ' + error.message;
        });
}

function displayWeather(data) {
    const cityname = document.getElementById('cityname');
    const temperature = document.getElementById('temperature');
    const condition = document.getElementById('condition');
    const humidity = document.getElementById('humidity');
    const wind = document.getElementById('wind');
    const lastupdated = document.getElementById('lastupdated');

    const { location, current } = data;
    cityname.innerHTML = `${location.name}`;
    temperature.innerHTML = `${current.temp_c} °C`;
    condition.innerHTML = `${current.condition.text}`;
    humidity.innerHTML = `${current.humidity}%`;
    wind.innerHTML = `${current.wind_kph} kph`;
    lastupdated.innerHTML = `${current.last_updated}`;
}
