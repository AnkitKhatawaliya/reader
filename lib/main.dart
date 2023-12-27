import 'package:flutter/material.dart';
import 'package:reader/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Screens/AdminScreens/AdminHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reader',
      theme: ThemeData(
        appBarTheme:  AppBarTheme(
          color: Colors.grey,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(1.0)),
          iconTheme: const IconThemeData(color: Colors.blueAccent),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      checkAndNav();
    });
  }

  Future<void> checkAndNav() async {
    int a = 2;
    if (a < 5) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const AdminHomePage()));
    } else {
      Fluttertoast.showToast(
        msg: "Failed to fetch student data",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.purple
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft)),
        child: const Center(child: Text("God Sr Sec School, Hussainka",
        style: TextStyle(color: Colors.white,fontSize: 24),)),
      ),
    );
  }
}