<?php
//Student Id = 2060350 
//Student Name = Inkesh Gharti
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
require_once('2060350_connection.php');
//calling the connection.php for connection with mysql 
$mysql = "SELECT * FROM weather_Api WHERE city = '{$_GET['city']}' AND weather_when >= DATE_SUB(NOW(), INTERVAL 5 HOUR) ORDER BY weather_when DESC limit 1";
//It will extract the data from MySQL database(weather) and extract the data by looking the weathe_when(date-time) and then take data only one from database (limit 1)
//  echo($mysql);
    $result = $connection -> query($mysql);
    // If 0 record found the below condition will run
    // print_r($result);
    if ($result->num_rows == 0) {
        $url = 'https://api.openweathermap.org/data/2.5/weather?q=' . $_GET['city'] . '&appid=db48fbadf769e57a4441dfe902076dfd&units=metric';
    // Get data from openweatherAPI and store in JSON object
        $data = file_get_contents($url);
        $json = json_decode($data, true);
        // Fetch required fields
        $weather_Temperature = $json['main']['temp'];
        $weather_Icon = $json['weather'][0]['icon'];
        $weather_Cloud = $json['weather'][0]['description'];
        $weather_Humidity = $json['main']['humidity'];
        $weather_Pressure = $json['main']['pressure'];
        $weather_Wind = $json['wind']['speed'];
        $weather_when = date("Y-m-d H:i:s");
        $city = $json['name'];
        // extracting the data from the jason object to insert in MySQL
        // Build INSERT SQL statement to insert the new data
        $mysql = "INSERT INTO weather_Api(temperature,icon, cloud, humidity, pressure,wind,weather_when,city)
        VALUES('{$weather_Temperature}', '{$weather_Icon}', '{$weather_Cloud}', '{$weather_Humidity}','{$weather_Pressure}', '{$weather_Wind}',  '{$weather_when}','{$city}')";
        // echo($mysql);
       // Run SQL statement and report errors

        if (!$connection -> query($mysql)) {
            echo("<h4>SQL error description: " . $connection -> error . "</h4>");
            }   
         $mysql = "SELECT * FROM weather_Api WHERE city = '{$_GET['city']}' AND weather_when >= DATE_SUB(NOW(), INTERVAL 5 HOUR) ORDER BY weather_when DESC limit 1";
         $result = $connection -> query($mysql);
    // If 0 record found
       $rows = $result->fetch_all(MYSQLI_ASSOC);
        print_r(json_encode($rows));
        //show in json format by extracting form MySQL database
        // echo("record not found");


    }
    else{
        //If condition does not match then it will display the data from MySQL databse to clint -server in json format.
        
        $rows = $result->fetch_all(MYSQLI_ASSOC);

        print_r(json_encode($rows));
        // echo("record  found");

    }


?>