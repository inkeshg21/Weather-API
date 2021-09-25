create database weather;
CREATE USER 'weatherAPI'@'localhost' IDENTIFIED BY 'weatherAPI';
GRANT ALL PRIVILEGES ON weather.* TO 'weatherAPI'@'localhost';
FLUSH PRIVILEGES;
CREATE TABLE weather_Api(
    temperature decimal(3.2),
    icon varchar(10),
    cloud varchar(20),
    humidity decimal(3.2),
    pressure decimal(3.2),
    wind decimal(3.2),
    weather_when TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    city varchar(15)
);
-- for dummy value check
INSERT into weather_Api(temperature, cloud, humidity,pressure,wind,weather_when,city)
VALUES(2,"cloudey" , 2.5, 1,21,12,3,curdate(),"Bolton");
-- for INSERT value in mysql database
INSERT INTO weather_Api(temperature,icon, cloud, humidity, pressure,wind,weather_when,city) VALUES ('{$weather_Temperature}', '{$weather_Icon}', '{$weather_Cloud}', '{$weather_Humidity}','{$weather_Pressure}', '{$weather_Wind}',  '{$weather_when}','{$city}');
-- for extraction fo databse with interval of time
SELECT * FROM weather_Api WHERE city = '{$_GET['city']}' AND weather_when >= DATE_SUB(NOW(), INTERVAL 5 HOUR) ORDER BY weather_when DESC limit 1;