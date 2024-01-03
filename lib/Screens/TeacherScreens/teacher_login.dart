import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:reader/Screens/TeacherScreens/TeacherHomePage.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'package:reader/Workflow/Base_URLs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class teacher_login extends StatefulWidget {
  const teacher_login({super.key});

  @override
  State<teacher_login> createState() => _teacher_loginState();
}

class _teacher_loginState extends State<teacher_login> {
  final TextEditingController _id = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text("Enter your Credentials.."),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Over_Images(),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          const Text(
                            "Welcome Teacher",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 23),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: _id,
                          decoration: InputDecoration(
                              labelText: "Enter you ID",
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: _password,
                          decoration: InputDecoration(
                              labelText: "Enter you Password",
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final response = await http.get(
                            Uri.parse(
                                "$Teacher_Base_url/validate_teacher/${_id.text.trim()}/${_password.text.trim()}"),
                          );
                          if (response.statusCode == 202) {
                            Map<String, dynamic> jsonResponse =
                                json.decode(response.body);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(
                                'Teacher_token', jsonResponse['Token']);
                            prefs.setBool("is_teacher_login", true);
                            Fluttertoast.showToast(
                              msg: " Login Successful , Fetching Details",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            await Future.delayed(const Duration(seconds: 1));
                            final info = await http.get(
                              Uri.parse(
                                  "$Teacher_Base_url/homepage_info/${_id.text.trim()}"),
                            );
                            if (info.statusCode == 202) {
                              Fluttertoast.showToast(
                                msg: "Navigating  ...",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              List<dynamic> hp_info = json.decode(info.body)[0];
                              print(hp_info);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TeacherHomePage(Teacher_HomePage: hp_info),
                                ),
                              );
                            }
                          } else {
                            if (response.statusCode == 406) {
                              Fluttertoast.showToast(
                                msg: "Error in Credentials...",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            } else {
                              int code = response.statusCode;
                              Fluttertoast.showToast(
                                msg: "Error Code : $code",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          }
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                        ),
                      ), //Handles the Login and Forwarding part, too much code
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
