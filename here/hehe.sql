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
INSERT into weather_Api(temperature, cloud, rain, humidity,pressure,wind_direction,wind,weather_when,city)
VALUES(2,"cloudey" , 2.5, 1,21,12,3,curdate(),"Bolton");
-- for INSERT value in mysql database
INSERT INTO weather_Api(temperature,icon, cloud, humidity, pressure,wind,weather_when,city) VALUES ('{$weather_Temperature}', '{$weather_Icon}', '{$weather_Cloud}', '{$weather_Humidity}','{$weather_Pressure}', '{$weather_Wind}',  '{$weather_when}','{$city}')";
SELECT * FROM weather_Api WHERE city = '{$_GET['city']}' AND weather_when >= DATE_SUB(NOW(), INTERVAL 5 HOUR) ORDER BY weather_when DESC limit 1;


CREATE USER 'weatherAPI'@'localhost' IDENTIFIED BY 'weatherAPI';
GRANT ALL PRIVILEGES ON weather.* TO 'weatherAPI'@'localhost';
FLUSH PRIVILEGES;

ALTER TABLE weather_Api ADD icon varchar(10) NOT NULL AFTER temperature;

local host name weatherAPI
pass= weatherAPI
php -S localhost:8000

TRUNCATE TABLE weather_Api;

INSERT into weather_Api(temperature, cloud, rain, humidity,pressure,wind_direction,wind,weather_when,city)
VALUES(2,"cloudey" , 2.5, 1,21,12,3,curdate(),"Bolton");

ALTER TABLE weather_Api CHANGE $wind wind AFTER wind_direction;

DELETE FROM weather_Api WHERE temperature = 0;
select user,host from mysql.user where user = 'weather_Api';


SELECT * FROM weather_Api WHERE city = "Bolton" AND weather_when >= DATE_SUB(NOW(), INTERVAL 1 SECOND) ORDER BY weather_when DESC limit 1;

ALTER TABLE weather_Api MODIFY cloud varchar(40);
ALTER TABLE weather_Api MODIFY temperature float(6);
ALTER TABLE weather_Api MODIFY cloud LONGTEXT(40);