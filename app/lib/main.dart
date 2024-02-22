import 'dart:convert';
import 'package:medicia/Widgets/SignIN.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:medicia/Widgets/Choose.dart';
import 'Widgets/Dashboard.dart';
import 'Widgets/AfterMain.dart';
import 'package:medicia/Widgets/find Best doctor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:camera/camera.dart';
import 'package:medicia/Widgets/Assessment.dart';

import 'Widgets/uploadReport.dart';
void sendPostRequest() async {
  var url = Uri.parse('https://pevooo.pythonanywhere.com/add/John');
  var headers = {'Content-Type': 'application/json'};
  var jsonBody = json.encode({
    'key': 'A31FAA21HWXLKK215601FTY72P23DX',
    'key2': 'value2',
    'password':'12323',
    'id':'122'
  });
  var response = await http.post(url, headers: headers, body: jsonBody);
  var jsonResponse = json.decode(response.body);
  print('Response: $jsonResponse');
}
void sendPtRequest() async {
  var url = Uri.parse('https://pevooo.pythonanywhere.com/get/122');
  var headers = {'Content-Type': 'application/json'};
  var jsonBody = json.encode({
    'key': 'A31FAA21HWXLKK215601FTY72P23DX',
  });
  var response = await http.post(url, headers: headers, body: jsonBody);
  var jsonResponse = json.decode(response.body);
  print('Response: $jsonResponse');
}
Future<void> main() async {
  sendPtRequest();
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  firstCamera = cameras.first;

  // Get a specific camera from the list of available cameras.
  runApp(DevicePreview(builder: (context)=> MyApp()));

}


var firstCamera;
double MobileWidth=0.0;
double MobileHeight=0.0;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    MobileWidth=MediaQuery.of(context).size.width;
    MobileHeight=MediaQuery.of(context).size.height;
   // writeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: Center(
            child:ListView(children: [
              Start(),
            ])
        ),
      ),
    );
  }
}


class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.center,
        width: MobileWidth,
        height: MobileHeight,
        // clipBehavior: Clip.antiAlias,
        color: Color(0xFF223F93),
        child: Row(

            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Column(
                children: [
                  SizedBox(height: MobileHeight*0.3,),
                  Container(
                    child: Image.asset('assets/images/Dr_start page.png',width: 200,),
                  ),//image
                  Container(
                      alignment: Alignment.center,
                      width: MobileWidth,
                      height: MobileHeight*.3,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),

                      ),
                      child: Column(
                          children:[
                            Center(
                              child: Column(

                                children: [
                                  SizedBox(height: MobileHeight*0.1,),
                                  AutoSizeText(
                                    'Welcome to our Medical '
                                    ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0F0F0F),
                                      fontSize: 22,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 0.03,

                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: MobileHeight*0.05,),
                                  AutoSizeText(
                                        'mobile app',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0F0F0F),
                                      fontSize: 22,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600,
                                      height: 0.03,

                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: MobileHeight*0.05,),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  Choose()),
                                        );
                                      },
                                      child: Text(
                                        'Get Started',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600,
                                          height: 0.02,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ]

                      ))
                ],
              ),
            ]

        ));





  }}