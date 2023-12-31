import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:reader/Screens/AdminScreens/AdminHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/Over_Images.dart';
import '../../Workflow/Base_URLs.dart';
import 'dart:convert';

class admin_login extends StatefulWidget {
  const admin_login({super.key});

  @override
  State<admin_login> createState() => Admin_loginState();
}

class Admin_loginState extends State<admin_login> {
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
                            "Welcome Admin",
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
                          Map<String, dynamic> requestBody = {
                            'ID': _id.text.trim(),
                            'Password': _password.text.trim(),
                          };
                          String requestBodyJson = jsonEncode(requestBody);

                          final response = await http.post(
                            Uri.parse("$Admin_Base_url/login"),
                            headers: {'Content-Type': 'application/json'},
                            body: requestBodyJson,
                          );
                          if (response.statusCode == 200 ||
                              response.statusCode == 202) {
                            Map<String, dynamic> jsonResponse =
                                json.decode(response.body);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(
                                'Admin_token', jsonResponse['Token']);
                            prefs.setBool("is_admin_login", true);
                            await Future.delayed(const Duration(seconds: 1));
                            Fluttertoast.showToast(
                              msg: " Login Successful",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            var localContext = context;
                            Navigator.push(
                              localContext,
                              MaterialPageRoute(
                                builder: (context) => const admin_homepage(),
                              ),
                            );
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
                      ),//Handles the Login and Forwarding part, too much code
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
