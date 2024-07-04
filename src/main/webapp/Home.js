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
    });

    // Prevent form submission default behavior
    document.getElementById('coordinateInput').addEventListener('submit', (event) => {
        event.preventDefault();
        getWeatherByLatLon();
    });

    document.getElementById('customDateInput').addEventListener('submit', (event) => {
        event.preventDefault();
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;
        CalculateAverage(startDate, endDate);
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
    const apiUrl = `https://api.weatherapi.com/v1/current.json?key=${apiKey}&q=${lat},${lon}`;

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
            console.error('Error fetching weather data:', error);
            document.getElementById('weatherInfo').innerText = 'Error fetching weather data: ' + error.message;
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

function CalculateAverage(startDate, endDate, avgCity) {
	    fetch('./data.json')
	        .then(res => res.json())
	        .then(data => {
				const cities = data.cities; // Corrected variable name
				const newStartDate= moment(startDate).format('MM/DD/YYYY');
				const newEndDate= moment(endDate).format('MM/DD/YYYY');
	            const cityData = cities.find(city => city.city === avgCity); // Corrected variable name
				console.log(cityData);
				
	            if (cityData) {
	                const temperatures = cityData.temperatures;
	                let total = 0;
	                let count = 0;

	                // Iterate through each date in the temperatures object
					
            for (const date in temperatures) {
				if (moment(date, 'MM/DD/YYYY').isSameOrAfter(newStartDate) && moment(date, 'MM/DD/YYYY').isSameOrBefore(newEndDate)) {
                      console.log(temperatures[date]);
                      total += temperatures[date];
                      count++;
                  }
			}

            if (count > 0) {
                const average = total / count;
                // Display average temperature on the web page
                const averageResult = document.getElementById('averageResult');
                averageResult.innerHTML = "<p>Average temperature in " + cityData.avgCity +" is " + average.toFixed(2) + " °C</p>";
            } else {
                console.log("No temperature data found between " + startDate + " and " + endDate);
                // Display message if no data found
                const averageResult = document.getElementById('averageResult');
                averageResult.innerHTML = "<p>No temperature data found between " + startDate + " and " + endDate + "</p>";
            }
		        } else {
		            console.log("City '" + cityName + "' not found in the data");
		            // Display message if city not found
		            const averageResult = document.getElementById('averageResult');
		            averageResult.innerHTML = "<p>No temperature data found between " + startDate + " and " + endDate + "</p>";
		        }
	        })
	        .catch(err => console.error('Error fetching data:', err));
	}
	//CalculateAverage('2023-07-10', '2023-09-20','Delhi');

