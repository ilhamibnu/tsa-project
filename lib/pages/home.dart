import 'package:anjayani/login.dart';
import 'package:anjayani/pages/gelocation.dart';
import 'package:anjayani/pages/geolocator.dart';
import 'setting.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum MenuItem {
  item1,
  item2,
}

int _selectedIndex = 0;
final screen = [
  // homePage(),
  // status(),
  // calls(),
  geolocation(),
  geolator(),
];

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => const MyApp()));
    // ignore: use_build_context_synchronouslye
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Cari Koordinat',
      style: optionStyle,
    ),
    Text(
      'Index 1: Cari Alamat',
      style: optionStyle,
    ),
    // Text(
    //   'Index 2: Calls',
    //   style: optionStyle,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("MeChats"),
          backgroundColor: Color.fromARGB(255, 16, 29, 37),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.search),
            ),
            PopupMenuButton(
                onSelected: (value) {
                  if (value == MenuItem.item1) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Setting(),
                    ));
                  } else if (value == MenuItem.item2) {
                    Future<void> _signOut() async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const loginscreen(),
                      ));

                      // ignore: use_build_context_synchronouslye
                    }

                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const loginscreen(),
                    // ));
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: MenuItem.item1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings,
                              color: Color.fromARGB(255, 16, 29, 37),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Setting'),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: MenuItem.item2,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Color.fromARGB(255, 16, 29, 37),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text('Logout'),
                            ),
                          ],
                        ),
                      ),

                      // PopupMenuItem(
                      //   value: MenuItem.item1,
                      //   child: Text('Setting'),
                      // ),
                      // PopupMenuItem(
                      //   value: MenuItem.item2,
                      //   child: Text('Logout'),
                      // ),
                    ]),
          ],
        ),
        drawer: DrawerScreen(),
        body: screen[_selectedIndex],
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(
        //     Icons.create,
        //     color: Colors.white,
        //   ),
        //   backgroundColor: Color.fromARGB(255, 16, 29, 37),
        //   onPressed: () {},
        // ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: 'Cari Koordinat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_rounded),
              label: 'Cari Alamat',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.phone),
            //   label: 'Calls',
            // ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 16, 29, 37),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
