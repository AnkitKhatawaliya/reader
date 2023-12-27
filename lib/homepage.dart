import 'package:flutter/material.dart';
import 'package:reader/Screens/AdminScreens/AdminHomePage.dart';
import 'package:reader/Screens/Other_Screens/Suggestion.dart';

import 'Widgets/Login_Type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int a = screenWidth.toInt();
    int b = (a ~/ 1.85);
    int c = (b ~/ 3);
    int d = (b ~/ 3);
    String imageUrl = 'https://picsum.photos/$a/$b';
    String iconLink = 'https://picsum.photos/$c/$d';

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
                              builder: (context) => const AdminHomePage()));
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
        body: SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Stack(
                  children: [
                    Image.network(imageUrl),
                  ],
                ),
              ),
              Positioned(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.48,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Login_type(
                                icon: Icons.icecream_outlined,
                                show_text: 'Login as Student',
                                onTap: () {},
                              ),
                              Login_type(
                                icon: Icons.account_balance_wallet,
                                show_text: 'Login as Parent',
                                onTap: () {},
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Login_type(
                                icon: Icons.school,
                                show_text: 'Login as Teacher',
                                onTap: () {},
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
                    Container(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width *
                            0.5, // set your minimum width
                        minHeight: MediaQuery.of(context).size.height *
                            0.11, // set your minimum height
                      ),
                      child: Card(
                        elevation: 0,
                        color: Colors.grey.shade300,
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.webhook_sharp),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Visit School Website")
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.28,
                left: MediaQuery.of(context).size.height * 0.25,
                child: ClipOval(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.height *
                        0.15, // Replace 'desiredWidth' with your preferred width
                    height: MediaQuery.of(context).size.height *
                        0.15, // Replace 'desiredHeight' with your preferred height
                    child: Image.network(iconLink, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
