import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/AdminScreens/AdminHomePage.dart';
import 'Screens/AdminScreens/Admin_login.dart';
import 'homepage.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool("is_admin_login")??false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const admin_homepage()));
    } else {      Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home_Screen()));
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