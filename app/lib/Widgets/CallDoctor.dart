import 'package:flutter/material.dart';
import 'package:medicia/main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
class CallDoctor extends StatefulWidget {
  const CallDoctor({super.key});

  @override
  State<CallDoctor> createState() => _CallDoctorState();
}

class _CallDoctorState extends State<CallDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
      ),
      body:
      Container(
        width: MobileWidth,
        height: MobileHeight,
        color:Color(0xFF223F93),
        child: ListView(
          children: [
            GFCard(
              color: Colors.white30,
              boxFit: BoxFit.cover,
              image: Image.asset('assets/images/PatientProfile 1.png'),
              title: GFListTile(
                avatar: GFAvatar(
                    backgroundImage:NetworkImage('https://th.bing.com/th?id=OIP.RPRpZ0mTLLrHDqxz4rhZuwHaHp&w=246&h=254&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                    shape: GFAvatarShape.square
                ),
                title: Text('Dr/John'),
                subTitle: Text('Surgeon'),
              ),
              buttonBar: GFButtonBar(
                children: <Widget>[

                  GFButton(
                    onPressed: () async {
                      final Uri url=Uri(
                          scheme: 'tel',
                          path: "452 869 2393"
                      );
                      if(await canLaunchUrl(url)){
                        await launchUrl(url);
                      }else{
                        print('Error');
                      }

                    },
                    text: 'call',
                  ),

                ],
              ),
            ),
            GFCard(
              color: Colors.white30,
              boxFit: BoxFit.cover,
              image: Image.asset('assets/images/PatientProfile 1.png'),
              title: GFListTile(
                avatar: GFAvatar(
                    backgroundImage:NetworkImage('https://th.bing.com/th?id=OIP.IVwf85npYYUcwRp4EIhqDgHaJm&w=219&h=284&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                    shape: GFAvatarShape.square
                ),
                title: Text('Dr/Ahmed'),
                subTitle: Text('Cardiologist'),
              ),
              buttonBar: GFButtonBar(
                children: <Widget>[

                  GFButton(
                    onPressed: () async {
                      final Uri url=Uri(
                          scheme: 'tel',
                          path: "452 861 2313"
                      );
                      if(await canLaunchUrl(url)){
                        await launchUrl(url);
                      }else{
                        print('Error');
                      }

                    },
                    text: 'call',
                  ),

                ],
              ),
            ),
            GFCard(
              color: Colors.white30,
              boxFit: BoxFit.cover,
              image: Image.asset('assets/images/PatientProfile 1.png'),
              title: GFListTile(
                avatar: GFAvatar(
                    backgroundImage:NetworkImage('https://th.bing.com/th?id=OIP.WPYPa4GubQVLa0kQqXcfvwHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                    shape: GFAvatarShape.square
                ),
                title: Text('Dr/Alaa'),
                subTitle: Text('Dentist'),
              ),
              buttonBar: GFButtonBar(
                children: <Widget>[

                  GFButton(
                    onPressed: () async {
                      final Uri url=Uri(
                          scheme: 'tel',
                          path: "452 889 2313"
                      );
                      if(await canLaunchUrl(url)){
                        await launchUrl(url);
                      }else{
                        print('Error');
                      }

                    },
                    text: 'call',
                  ),

                ],
              ),
            ),
            GFCard(
              color: Colors.white30,
              boxFit: BoxFit.cover,
              image: Image.asset('assets/images/PatientProfile 1.png'),
              title: GFListTile(
                avatar: GFAvatar(
                    backgroundImage:NetworkImage('https://th.bing.com/th?id=OIP._oxcIlYpifshlT99W73txAHaJ4&w=216&h=288&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                    shape: GFAvatarShape.square
                ),
                title: Text('Dr/Sherif'),
                subTitle: Text('Neurologist'),
              ),
              buttonBar: GFButtonBar(
                children: <Widget>[

                  GFButton(
                    onPressed: () async {
                     final Uri url=Uri(
                       scheme: 'tel',
                       path: "452 869 2313"
                     );
                      if(await canLaunchUrl(url)){
                        await launchUrl(url);
                      }else{
                        print('Error');
                      }

                    },
                    text: 'call',
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
