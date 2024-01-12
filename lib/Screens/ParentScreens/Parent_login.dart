import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:reader/Screens/ParentScreens/ParentHomeScreen.dart';
import 'package:reader/Workflow/Base_URLs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/Over_Images.dart';

class Parent_login extends StatefulWidget {
  const Parent_login({super.key});

  @override
  State<Parent_login> createState() => _Parent_loginState();
}

class _Parent_loginState extends State<Parent_login> {
  final TextEditingController _roll_no = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _class = "1";
  String _section = "A";

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
                            "Welcome Dear Guardian",
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
                      Row(
                        children: [
                          Row(
                            children: [
                              Text('Select Class :   ',
                                  style: TextStyle(
                                      color: Colors.tealAccent.shade700)),
                              DropdownButton<String>(
                                value: _class,
                                icon: const Icon(Icons.list),
                                onChanged: (newValue) {
                                  setState(() {
                                    _class = newValue!;
                                  });
                                },
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: "1",
                                    child: Text("First"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "2",
                                    child: Text("Second"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "3",
                                    child: Text("Third"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "4",
                                    child: Text("Fourth"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "5",
                                    child: Text("Fifth"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "6",
                                    child: Text("Sixth"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "7",
                                    child: Text("Seventh"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "8",
                                    child: Text("Eighth"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "9",
                                    child: Text("Nine"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "10",
                                    child: Text("Ten"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "11",
                                    child: Text("Eleven"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "12",
                                    child: Text("Twelve"),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                              ),
                              Text("Select Section :   ",
                                  style: TextStyle(
                                      color: Colors.tealAccent.shade700)),
                              DropdownButton<String>(
                                value: _section,
                                icon: const Icon(Icons.label),
                                onChanged: (newValue) {
                                  setState(() {
                                    _section = newValue!;
                                  });
                                },
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: "A",
                                    child: Text("A   "),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "B",
                                    child: Text("B  "),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "C",
                                    child: Text("C"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: "D",
                                    child: Text("D"),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: _roll_no,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Enter Roll No of your Kid",
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
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
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final response = await http.get(
                            Uri.parse(
                                "$Client_Base_url/validate_Client/$_class/$_section/${_roll_no.text.trim()}/${_password.text.trim()}/Parent"),
                          );
                          if (response.statusCode == 200) {
                            Map<String, dynamic> jsonResponse =
                                json.decode(response.body);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(
                                'Parent_Token', jsonResponse['Token']);
                            prefs.setBool("is_parent_login", true);
                            await Future.delayed(const Duration(seconds: 1));
                            Fluttertoast.showToast(
                              msg: " Login Successful",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            final info = await http.get(
                              Uri.parse(
                                  "$Client_Base_url/Home_page_info/$_class/$_section/${_roll_no.text.trim()}"),
                            );
                            if (info.statusCode == 200) {
                              List<dynamic> hp_info = json.decode(info.body);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ParentHomeScreen(Parent_HomePage: hp_info, standard: _class, section: _section),
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
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
