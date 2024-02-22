import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:getwidget/getwidget.dart';
import 'package:medicia/main.dart';
class BestDoctor extends StatelessWidget {
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
      appBar: AppBar(title: Text('Find Best Doctor')),
      body: Center(
        child: Container(
          width: MobileWidth,
          height: MobileHeight,
          color: Colors.white,
          child: Column(children: [
            SizedBox(
              height: MobileHeight * .2,
            ),
            Image.asset('assets/images/medical-team 1.png',width: MobileWidth*0.671,),
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

                    GFCard(
                      height: MobileHeight*0.2,
                      borderOnForeground: false,
                      color:Color(0xFF223F93) ,
                      boxFit: BoxFit.cover,
                      content: Column(
                        children: [
                          SizedBox(height: MobileHeight*0.01,),
                          Text(
                            'Find Your Doctor Online',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              height: 0.06,
                            ),
                          ),
                          SizedBox(height: MobileHeight*0.05,),
                          Text("Find a doctor will take the best care of your health and medicine alarm"),
                        ],
                      ),
                      buttonBar: GFButtonBar(
                        children: <Widget>[
                          GFButton(

                            onPressed: (){

                            },
                            text: "Skip",
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