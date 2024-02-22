import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:medicia/Widgets/Choose.dart';
import 'package:medicia/main.dart';

class Home extends StatelessWidget {
  @override
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Color(0xFF223F93),
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login/SignUp')),
      body: Container(
        width: MobileWidth,
        height: MobileHeight,
        color: Colors.white,
        child: Column(children: [
          //photo
          SizedBox(height:MobileHeight*.2 ),
          Image.asset('assets/images/image home.png',height: MobileHeight*.2 ,),
          SizedBox(height:MobileHeight*.1 ),
          AutoSizeText(
            "Let's You IN",
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
          SizedBox(height:MobileHeight*.05 ),
          ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Choose()),
            ); },
            child: Text('Sign IN'),
          ),
          ElevatedButton(
            style: raisedButtonStyle,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Choose()),
              );
            },
            child: Text('Sign Up'),
          )
        ],),
      ),

    );



  }
}