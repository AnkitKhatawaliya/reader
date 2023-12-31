import 'package:flutter/material.dart';
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
  String _section= "A";


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                                Text('Select Class :   ',style: TextStyle(color: Colors.tealAccent.shade700)),
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
                                SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                Text("Select Section :   ",style: TextStyle(color: Colors.tealAccent.shade700)),
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
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),

                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
