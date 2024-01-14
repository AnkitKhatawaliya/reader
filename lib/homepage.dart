import 'package:flutter/material.dart';
import 'package:reader/Screens/Other_Screens/Suggestion.dart';
import 'package:reader/Screens/TeacherScreens/teacher_login.dart';
import 'package:reader/Widgets/Over_Images.dart';
import 'Screens/AdminScreens/Admin_login.dart';
import 'Screens/ParentScreens/Parent_login.dart';
import 'Widgets/Login_Type.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This and that"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
              ),
              child: Text('Drawer Header'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const admin_login()));
                  },
                  title: const Row(children: [
                    Icon(Icons.admin_panel_settings),
                    SizedBox(width: 5),
                    Text('Admin Panel')
                  ]),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuggestionScreen()));
                  },
                  title: const Row(children: [
                    Icon(Icons.settings_suggest_sharp),
                    SizedBox(width: 5),
                    Text('Suggestion Box')
                  ]),
                ),
                ListTile(
                  onTap: () {},
                  title: const Row(children: [
                    Icon(Icons.web),
                    SizedBox(width: 5),
                    Text('Web Address')
                  ]),
                ),
                ListTile(
                  onTap: () {},
                  title: const Row(children: [
                    Icon(Icons.link),
                    SizedBox(width: 5),
                    Text('Other Links')
                  ]),
                ),
                ListTile(
                  onTap: () {},
                  title: const Row(children: [
                    Icon(Icons.school_outlined),
                    SizedBox(width: 5),
                    Text('About School')
                  ]),
                ),
                ListTile(
                  onTap: () {},
                  title: const Row(children: [
                    Icon(Icons.developer_board),
                    SizedBox(width: 5),
                    Text('About Developer')
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Over_Images(),
            SizedBox(
              child: Column(
                children: [
                  Row(
                    children: [
                      Login_type(
                        icon: Icons.icecream_outlined,
                        show_text: 'Login as Student',
                        onTap: () {},
                      ),
                      Login_type(
                        icon: Icons.account_balance_wallet,
                        show_text: 'Login as Parent',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Parent_login()));
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Login_type(
                        icon: Icons.school,
                        show_text: 'Login as Teacher',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const teacher_login()));
                        },
                      ),
                      Login_type(
                        icon: Icons.info,
                        show_text: 'About School',
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
            Login_type(icon: Icons.webhook_sharp, show_text: 'Visit School Website', onTap: () {  },)
          ],
        ),
      ),
    );
  }
}
