import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:medicia/Widgets/AfterMain.dart';
import 'package:medicia/Widgets/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medicia/main.dart';
import 'package:medicia/Widgets/Choose.dart';
import 'package:medicia/Widgets/Dashboard.dart';
class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
var c;
var userid;
var currentuser;
var UserName;
var UserMobile;
var UserEmail;
var Usertype;
class _AuthScreenState extends State<AuthScreen> {
  RegisterationController registerationController =
  Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());
  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    c=context;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MobileHeight,
          child: Padding(
            padding: EdgeInsets.all(36),
            child: Center(
              child: Obx(
                    () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          'WELCOME',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            color: !isLogin.value ? Color(0xFF223F93) : Colors.amber,
                            onPressed: () {
                              isLogin.value = false;
                            },
                            child: Text('Register'),
                          ),
                          MaterialButton(
                            color: isLogin.value ? Color(0xFF223F93) : Colors.amber,
                            onPressed: () {
                              isLogin.value = true;
                            },
                            child: Text('Login'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      isLogin.value ? loginWidget() : registerWidget()
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(registerationController.nameController, 'Name'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.emailController, 'ID'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.passwordController, 'Password'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(registerationController.typeController, 'Type'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(registerationController.phoneController, 'Phone Number'),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => registerationController.registerWithEmail(),
          title: 'Register',
        )
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.emailController, 'Id',),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.passwordController, 'Password'),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => loginController.loginWithEmail(),
          title: 'Login',
        )
      ],
    );
  }
}
class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  InputTextFieldWidget(this.textEditingController, this.hintText);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.black,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(bottom: 15),
            focusColor: Color(0xFF223F93)),
      ),
    );
  }
}
class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const SubmitButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none)),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xFF223F93),
              )),
          onPressed: onPressed,
          child: Text(title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}
class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail+emailController.text);
      Map body = {
        'key': 'A31FAA21HWXLKK215601FTY72P23DX',
        'name': nameController.text,
        'id': emailController.text.trim(),
        'type':typeController.text,
        'password': passwordController.text,
        'phone':phoneController.text
      };

      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['status'] == 1) {

          Navigator.push(
            c,
            MaterialPageRoute(builder: (context) =>  CustomTabBarsPage()),
          );
          nameController.clear();
          emailController.clear();
          passwordController.clear();
        } else {
          throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail+emailController.text);
      Map body = {
        'key': 'A31FAA21HWXLKK215601FTY72P23DX',
        'id': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        print(json['status'].toString());
        if (json['status'] == 1) {
          userid=emailController.text;
          currentuser=jsonDecode(response.body);
          UserName=currentuser['name'];
          UserEmail=currentuser['id'];
          UserMobile=currentuser['phone'];
          Usertype=currentuser['type'];
          print(UserName);
          // var token = json['data']['Token'];
          // final SharedPreferences? prefs = await _prefs;
          // await prefs?.setString('token', token);
          Navigator.push(
            c,
            MaterialPageRoute(builder: (context) =>  Profile()),
          );
          emailController.clear();
          passwordController.clear();

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
}
class ApiEndPoints {
  static final String baseUrl = 'https://pevooo.pythonanywhere.com/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'add/';
  final String loginEmail = 'get/';
}

