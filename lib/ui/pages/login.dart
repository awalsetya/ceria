import 'dart:convert';

import 'package:ceria/provider/login_provider.dart';
import 'package:ceria/services/service.dart';
import 'package:ceria/shared/icons.dart';
import 'package:ceria/shared/theme.dart';
import 'package:ceria/ui/pages/app.dart';
import 'package:ceria/ui/widget/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController noTelp = TextEditingController();
  TextEditingController password = TextEditingController();

  // String token = '';
  // String errMsg = '';

  // setToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     token = Provider.of<LoginProvider>(context, listen: false).token;
  //   });
  //   await prefs.setString('token', token);
  // }

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  // signIn(noTelp, password) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   Map data = {'phone': noTelp, 'password': password};

  //   var jsonResponse;
  //   var response = await http.post(NetworkURL.login(), body: data);
  //   if (response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     if (jsonResponse != null) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       pref.setString("token", jsonResponse['token']);
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (BuildContext context) => App()),
  //           (Route<dynamic> route) => false);
  //     }
  //   } else {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     print(response.body);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<LoginProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Form(
          key: _formKey,
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 90,
                            width: 100,
                            child: Image.asset("assets/img/CERIA.jpg"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "Clean Home\nClean Life.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Book Cleaners at the Comfort\nof you home.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 250,
                            child: SvgPicture.asset(
                              iconLogo,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 1,
                      left: 1,
                      child: Container(
                        height: 365,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 55.0,
                                child: TextFormField(
                                  controller: noTelp,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Tolong masukan nomor telepon';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.only(top: 14.0, right: 70),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(17),
                                      child: Text(
                                        '62 ',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                    hintText: 'Nomor Telepon',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 55,
                                child: TextFormField(
                                  controller: password,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Tolong masukan password';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(top: 14.0),
                                      hintText: 'Password',
                                      hintStyle: TextStyle()),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    login.login(noTelp.text.trim(),
                                        password.text.trim());
                                    if (login == null) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  App()),
                                          (Route<dynamic> route) => false);
                                    } else {
                                      AlertDialog(title: Text('login gagal'));
                                    }
                                  }
                                },
                                child: Container(
                                  width: 500,
                                  child: CustomButton(
                                    "Login",
                                    color: Colors.blueAccent,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Lupa password ?",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Belum punya akun?"),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text("Daftar disini"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
