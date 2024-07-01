import 'package:http/http.dart' as http;
import 'dart:convert';

class Worker {
  String?location;

  Worker({this.location}) {
    location = this.location;
  }


  String?temp;
  String?humidity;
  String?air_speed;
  String?description;
  String?main;
  String?icon;


  String?user;

  Future<void> getData() async {
    try {
      final String apiKey = "5c60799ff3dedda6df8b8a92a6bb5115";
      final Uri url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=5c60799ff3dedda6df8b8a92a6bb5115");
      final http.Response response = await http.get(url);
      Map data = jsonDecode(response.body);
      print(data);


      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp']-273.15;

//Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind["speed"]/0.27777777777778;


      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];
      icon = weather_main_data["icon"].toString();



      //Assigning Values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
    }
    catch(e){
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Sorry!Buddy can't find";
      icon ="09d";

    }
  }

}
