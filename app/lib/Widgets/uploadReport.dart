import 'package:flutter/material.dart';
import 'package:medicia/main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:medicia/Widgets/TakePhoto.dart';
import 'package:medicia/main.dart';
import 'SignIN.dart';
import 'package:camera/camera.dart';
class uploadreport extends StatelessWidget {
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
      appBar: AppBar(title: Text('Upload A Report')),
      body: Center(
        child: Container(
          width: MobileWidth,
          height: MobileHeight,
          color: Colors.white,
          child: Column(children: [
            SizedBox(height: MobileHeight*0.05,),
            Image.asset('assets/images/Report.png',width: MobileWidth*.6,),
            SizedBox(height: MobileHeight*0.32,),
            Container(
                width: MobileWidth,
                height: MobileHeight*0.27,
                decoration: ShapeDecoration(
                  color: Color(0xFF223F93),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),

                ),
                child:Column(
                  children: [
                    SizedBox(
                      height: MobileHeight*0.019,
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
                                MaterialPageRoute(builder: (context) => TakePictureScreen(camera: firstCamera,)),
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
