//import 'dart:html';

//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';  //  ipmort geolocator ////
import 'package:http/http.dart';      ////     fetch from internet
import'dart:convert';      //// to access data ;
const my_key='5ee21836970eaefe94c41be2c987b85c';
var lat;
var lon;
int temp2;
List<Widget>ff= List<Widget>() ;

var grp=Text('wish you a nice day... ' ,style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w900,fontSize: 25.0),);
//////////////////****//////////////
var mai ;
double temp ;
var city ;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(




      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[900],
          actions: [
            Center(
              child: Text('!الجو ايه',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  //color: Colors.white70
                ),

              ),
            ),
            SizedBox(width: 40.0,)
          ],

        ),
        backgroundColor: Colors.pink[100],
        body: SafeArea(child: q())

      )
    );
  }
}









class q extends StatefulWidget {
  @override
  _qState createState() => _qState();
}

class _qState extends State<q> {
@override
  void initState() {

    // TODO: implement initState
   //getW();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Colors.white70,
        )

      ),

      child: Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [


          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: mai==null? shit1() : shit()



              ),
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 8.0),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16.0),
               border: Border.all(

                 width: 5,
                 color: Colors.pink[800]
               ),
               color: Colors.pink,


             ),
             width: double.infinity,
             height: 60.0,

             child: MaterialButton(
               child: Text('Click to get your location temperture !!',style: TextStyle(fontWeight: FontWeight.w700),),
               onPressed: ()async{
                 setState(()  {
                   grp=Text('please wait , the data is loading...',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20.0),);
                 });

                 await getW();
                 /////////////////////////****************************************////////////////////////////////////////////////////////////////////


               setState(() {
                 temp=temp-273;
                 temp2=temp.round();

               });
               },

             ),
           ),
         ),
          //flag,


        ],

      ),
      ),

    );
  }
}







//////////////////////////////////////my_function_//////////////
// ////////////////////////////////
Future getlocation() async {
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
   lat=position.latitude;
   lon=position.longitude;
//return lat ;

}

Future getW()async {


  await getlocation();

    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=5ee21836970eaefe94c41be2c987b85c');
    //var data=response.statusCode;
     var data = response.body;
     mai = jsonDecode(data)['weather'][0]['main'];
     temp = jsonDecode(data)['main']['temp'];
     city = jsonDecode(data)['name'];



  print(mai);
  print(temp - 273);
  print(city);
}
Widget shit() {
  //flag=grp;
  return Container(
    decoration: BoxDecoration(color: Colors.pink[200],
      border: Border.all(
          width: 3.0,
          color: Colors.pink[900]

      ),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(90.0),
        topLeft: Radius.circular(16.0),
        bottomLeft: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),


      ),
    ),
    //height: 400.0,
    width: double.infinity,
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$mai',
          style: TextStyle(
              fontSize: 100.0,
              fontWeight: FontWeight.w900,
              color: Colors.white70
          ),
        ),


        Text('$temp2',


          style: TextStyle(
              fontSize: 100.0,
              fontWeight: FontWeight.w900,
              color: Colors.white70
          ),
        ),


      ],
    ),
  );
}
Widget shit1(){

  return  Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(child: grp)
    ),
  );
}
//Widget flag=Icon(Icons.assignment);