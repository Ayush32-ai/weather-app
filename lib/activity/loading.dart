import 'package:flutter/material.dart';
import 'package:weather/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String?temp;
  String?hum;
  String?air_speed;
  String?des;
  String?main;
  String?icon;
  String?city = "Indore";


 void startApp(String?city)async{
    Worker instance = Worker(location: city);
    await instance.getData();
  print(instance.temp);
  temp = instance.temp;
  hum = instance.humidity;
  air_speed = instance.air_speed;
  des = instance.description;
  main = instance.main;
    icon = instance.icon;
  Future.delayed(Duration(seconds:2),(){
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      "temp_value" : temp,
      "hum_value" : hum,
      "air_speed_value" : air_speed,
      "des_value" : des,
      "main_value" : main,
      "icon_value": icon,
      "city_value":city,

    });
  });


 }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final Map?search = ModalRoute.of(context)?.settings?.arguments as Map?;

   if(search?.isNotEmpty ??false)
     {
       city = search?['searchText'];
     }
   startApp(city);
    return Scaffold(
        backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Center(
        
            child:Column(
              mainAxisAlignment:MainAxisAlignment.center,
            children:<Widget>[
              SizedBox(height: 180,),
              Image.asset("image/ayush.jpeg",height: 240,width: 240,),
              Text("Mausam App",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),),
          SizedBox(height: 10,),
          Text("Made By Ayush",
          style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),),
            SizedBox(height: 40,),
            SpinKitWave(
              color: Colors.black,
              size: 50.0,
            ),
        
            ]
        )
        
        ),
      )

      );
  }
}
