		function getWeatherByCityName(){
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
		                    console.log(data);
		                    displayWeather(data);
		                })
		                .catch(error => {
		                    console.error('There has been a problem with your fetch operation:', error);
		                    document.getElementById('weatherInfo').innerText = 'Error: ' + error.message;
		                });
        	}
			
//				function getWeatherByLatLon(){
//						const apiKey = '38370608b7254b4dbe534835240207';
//						const lat = document.getElementById('latInput').value;
//						const lon = document.getElementById('lonInput').value;
//						const apiUrl = `http://api.weatherapi.com/v1/current.json?key=${apiKey}&q=${lat},${lon}`;
//					 
//								fetch(apiUrl)
//					                .then(response => {
//					                    if (!response.ok) {
//					                        throw new Error('Network response was not ok ' + response.statusText);
//					                    }
//					                    return response.json();
//					                })
//					                .then(data => {
//					                    console.log(data);
//					                    displayWeather(data);
//					                })
//					                .catch(error => {
//					                    console.error('There has been a problem with your fetch operation:', error);
//					                    document.getElementById('weatherInfo').innerText = 'Error: ' + error.message;
//					                });
//			        	}
						
        function displayWeather(data) {
            const weatherInfoDiv = document.getElementById('container');

			const cityname = document.getElementById('cityname');
            const { location, current } = data;
			cityname.innerHTML= `${location.name}`
			temperature.innerHTML=`${current.temp_c} °C`
		    condition.innerHTML=`${current.condition.text}`
			humidity.innerHTML=`${current.humidity}%`
			wind.innerHTML=`${current.humidity}%`
			lastupdated.innerHTML=` ${current.last_updated}`

           /* weatherInfoDiv.innerHTML = `
                <h2>Weather in ${location.name}, ${location.region}, ${location.country}</h2>
                <p>Temperature: ${current.temp_c} °C</p>
                <p>Condition: ${current.condition.text}</p>
                <p>Wind: ${current.wind_kph} kph</p>
                <p>Humidity: ${current.humidity}%</p>
                <p>Last Updated: ${current.last_updated}</p>
            `;*/
        }