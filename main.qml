import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "Weather App"

    Rectangle {
        width: parent.width
        height: parent.height

        Column {
            anchors.centerIn: parent
            spacing: 20

            TextField {
                id: cityInput
                placeholderText: "Enter city name"
            }

            Button {
                text: "Get Weather"
                onClicked: {

                    var apiKey = "c89f8ae3e03f11583f6220874da0b096";
                    var apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=" + cityInput.text + "&units=metric&APPID=" + apiKey;

                    var xhr = new XMLHttpRequest();
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                var response = JSON.parse(xhr.responseText);
                                var temperature = response.main.temp;
                                weatherLabel.text = "Temperature in " + cityInput.text + ": " + temperature + "°C";
                            } else {
                                weatherLabel.text = "Error: Unable to fetch weather data";
                            }
                        }
                    };

                    xhr.open("GET", apiUrl, true);
                    xhr.send();
                }
            }

            Text {
                id: weatherLabel
                textFormat: Text.RichText
            }

        }


    }
}
