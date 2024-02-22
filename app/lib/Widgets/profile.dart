import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicia/Widgets/AfterMain.dart';
import 'package:medicia/Widgets/SignIN.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medicia/main.dart';
import 'package:medicia/Widgets/Choose.dart';
import 'package:medicia/Widgets/Dashboard.dart';
import 'package:getwidget/getwidget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(color: Color(0xFF223F93),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                 ListTile(
                  leading: ElevatedButton.icon(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) =>  CustomTabBarsPage()),
                    )}, label: Text('Back'),

                  ),
                  trailing: Icon(Icons.menu),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      maxRadius: 65,
                      backgroundImage: AssetImage("assets/6195145.jpg"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      "$UserName",
                      style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                    )
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: Expanded(
                      child: ListView(
                        children: [
                          Card(
                            margin:
                            const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                            color: Colors.white70,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child:  ListTile(
                              leading: Icon(
                                Icons.privacy_tip_sharp,
                                color: Colors.black54,
                              ),
                              title: Text(
                                "Id user : $UserEmail",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold,color:Colors.black),
                              ),

                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            color: Colors.white70,
                            margin:
                            const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child:  ListTile(
                              leading: Icon(
                                Icons.history,
                                color: Colors.black54,
                              ),
                              title: Text(
                                "Mobile : $UserMobile",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold,color:Colors.black),
                              ),

                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            color: Colors.white70,
                            margin:
                            const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child:  ListTile(
                              leading:
                              Icon(Icons.help_outline, color: Colors.black54),
                              title: Text(
                                "Type : $Usertype",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold,color:Colors.black),
                              ),

                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            color: Colors.white70,
                            margin:
                            const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: const ListTile(
                              leading: Icon(
                                Icons.privacy_tip_sharp,
                                color: Colors.black54,
                              ),
                              title: Text(
                                'Appointments',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold
                                ,color:Colors.black),
                              ),

                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                        ],
                      )),
                )
              ],
            ),
          ),
        );
  }
}
