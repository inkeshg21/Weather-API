// window.onload = function () {
// }
// require_once('connection.php');
var tmp;
var org_temp;
var org_temprature;
var wind;
// function get_Data() {

    axios.get('http://api.openweathermap.org/data/2.5/weather?q=Bolton,uk&appid=db48fbadf769e57a4441dfe902076dfd&units=metric', {
    })
        .then(response => {
            console.log(response)
            document.getElementById("city_Name").innerHTML = `${response.data.name} [UK]`;
            document.getElementById("temp").innerHTML = `Temperature :  ${response.data.main.temp}°C`;
            document.getElementById("Cloud").innerHTML = `Cloud :  ${response.data.clouds.all}%`;
            document.getElementById('weather-Icon').innerHTML = `<img src='http://openweathermap.org/img/wn/${response.data.weather[0].icon}.png' width="10%"; height="2%;">`
            document.getElementById("humidity").innerHTML = `Humidity :  ${response.data.main.humidity}%`;
            document.getElementById("pressure").innerHTML = `Pressure : ${response.data.main.pressure}hPa`;
            document.getElementById("rain").innerHTML = `Rain : ${response.data.weather[0].description}`;
            document.getElementById("wind").innerHTML = `Wind speed  :  ${response.data.wind.speed} m/s`;
            document.getElementById("wind_direction").innerHTML = `Wind direction : ${response.data.wind.deg}°`;
        })
        .catch(error => {
            console.log(error)
        })
        .then(function () {
            console.log("Something is wrong");
          });

// }