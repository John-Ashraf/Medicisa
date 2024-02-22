import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:getwidget/getwidget.dart';
import 'package:medicia/Widgets/AfterMain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medicia/main.dart';
import 'package:medicia/Widgets/Choose.dart';
import 'package:medicia/Widgets/Dashboard.dart';
import 'package:camera/camera.dart';
import 'dart:typed_data';

import 'SignIN.dart';
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white, backgroundColor: Color(0xFF223F93),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);


// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();
            String imgString =image.readAsString().toString();

            if (!context.mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                  Photo: imgString,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

}
Future<void> loginWithEmail(String photo) async {
  var headers = {'Content-Type': 'application/json'};
  try {
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.upload+userid);
    Map body = {
      'key': 'A31FAA21HWXLKK215601FTY72P23DX',
      'id': userid,
      'filedata':photo,
      'filename':'Repot+$userid'
    };
    http.Response response =
    await http.post(url, body: jsonEncode(body), headers: headers);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Navigator.push(
        c,
        MaterialPageRoute(builder: (context) =>  CustomTabBarsPage()),
      );
      print(json['status'].toString());
      if (json['status'] == 1) {
        // var token = json['data']['Token'];
        // final SharedPreferences? prefs = await _prefs;
        // await prefs?.setString('token', token);
        Navigator.push(
          c,
          MaterialPageRoute(builder: (context) =>  CustomTabBarsPage()),
        );

      }
    } else {

      throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
    }
  } catch (error) {
    Get.back();
    showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(error.toString())],
          );
        });
  }
}
// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String Photo;
  const DisplayPictureScreen({super.key, required this.imagePath, required this.Photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        width: MobileWidth,
        height: MobileHeight,
        child: Column(
          children: [
            Image.asset(imagePath),
            ElevatedButton(onPressed: (){
              loginWithEmail(Photo);

            }, child:Text('Save') )
          ],
        ),
      ),
    );
  }
}
class ApiEndPoints {
  static final String baseUrl = 'https://pevooo.pythonanywhere.com/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'add/';
  final String loginEmail = 'get/';
  final String upload = 'upload_report/';
}
