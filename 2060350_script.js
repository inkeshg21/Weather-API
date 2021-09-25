window.onload = function () {
}
var tmp;
var org_temp;
var org_temprature;
var wind;
function get_Data() {
    if(localStorage.time != null && parseInt(localStorage.time) + 18000000 > Date.now()){
            let freshness = Math.round((Date.now() - localStorage.time)/1000) + " second(s)";
            document.getElementById("city_Name").innerHTML = ["Uk it's city : " + localStorage.city];
            document.getElementById("temp").innerHTML = "Current temperature :  " + localStorage.temperature + "°c";
            document.getElementById("Cloud").innerHTML = "Current Cloud : " + localStorage.cloud; 
            document.getElementById("weather-Icon").innerHTML = "Weather be like :" + `<img src='http://openweathermap.org/img/wn/${localStorage.weather_Icon}.png' width="11%"; height="11%;">`;
            document.getElementById("humidity").innerHTML = "Humidity : " + localStorage.humidity + "%";
            document.getElementById("pressure").innerHTML = "Pressure : " + localStorage.pressure + " hPa";
            document.getElementById("wind").innerHTML = "Wind Speed : " + localStorage.wind + " m/s";
    }
    else{
    
    axios.get('http://localhost:4000/2060350_extract.php?city=Bolton', {
    })
        .then(response => {
            console.log(response)
            document.getElementById("city_Name").innerHTML = [ "Uk it's city : " + response.data[0].city];
            document.getElementById("temp").innerHTML = ["Current temperature :  " + response.data[0].temperature + "°c"];
            document.getElementById("Cloud").innerHTML = ["Current Cloud : " + response.data[0].cloud];
            document.getElementById('weather-Icon').innerHTML = "Weather be like :" + `<img src='http://openweathermap.org/img/wn/${response.data[0].icon}.png' width="11%"; height="11%;">`
            document.getElementById("humidity").innerHTML = ["Humidity : " + response.data[0].humidity + "%"];
            document.getElementById("pressure").innerHTML = ["Pressure : " + response.data[0].pressure + " hPa"];
            document.getElementById("wind").innerHTML = ["Wind Speed : " + response.data[0].wind + " m/s"];
            localStorage.city = response.data[0].city;
            localStorage.temperature = response.data[0].temperature;
            localStorage.humidity = response.data[0].humidity;
            localStorage.cloud = response.data[0].cloud;
            localStorage.pressure = response.data[0].pressure;
            localStorage.wind = response.data[0].wind;
            localStorage.weather_Icon = response.data[0].icon;
            localStorage.time = Date.now(); // milliseconds since January 1 1970
        })
        .catch(error => {
            console.log(error)
        })
        .then(function () {
            console.log("Happy Learning");
          });

}
}