import 'package:flutter/material.dart';
import 'package:medicia/main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:medicia/Widgets/TakePhoto.dart';
import 'package:medicia/main.dart';
import 'uploadReport.dart';
import 'SignIN.dart';
import 'package:camera/camera.dart';
class Choose extends StatelessWidget {
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
      appBar: AppBar(title: Text('Choose Your Role')),
      body: Center(
        child: Container(
          width: MobileWidth,
          height: MobileHeight,
          color: Colors.white,
          child: Column(children: [
            SizedBox(
              height: MobileHeight * .2,
            ),
            Row(
              children: [
                SizedBox(width: MobileWidth*.2,),
                Image.asset('assets/images/dr.png',width: MobileWidth*.23,),
                Text(
                  'OR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0.03,
                  ),
                ),
              Image.asset('assets/images/ill.png',width: MobileWidth*.23,),
                //image2
              ],
            ),
            SizedBox(height: MobileHeight*.05,),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>AuthScreen()),
              ); },
              child: Text('Doctor'),
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AuthScreen()),
              ); },
              child: Text('Patient'),
            ),
            SizedBox(height: MobileHeight*0.114,),
            Container(
              width: MobileWidth,
              height: MobileHeight*0.25,
              decoration: ShapeDecoration(
                color: Color(0xFF223F93),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),

              ),
              child:Column(
                children: [
                  SizedBox(
                    height: MobileHeight*0.05,
                  ),
                  GFCard(
                    borderOnForeground: false,
                    color:Color(0xFF223F93) ,
                    boxFit: BoxFit.cover,
                    content: Text("This selection will enable us to provide you with personalized and relevant services."),
                    buttonBar: GFButtonBar(
                      children: <Widget>[
                        GFButton(

                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AuthScreen()),
                            );
                          },
                          text: "Next",
                          shape: GFButtonShape.pills,
                          size: GFSize.LARGE,
                          blockButton: true,
                        ),

                      ],
                    ),
                  ),
                ],
              )
            ),
          ]),
        ),
      ),
    );
  }
}
