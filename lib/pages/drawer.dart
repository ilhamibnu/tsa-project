import 'package:flutter/material.dart';
import 'gelocation.dart';
import 'geolocator.dart';
import 'package:anjayani/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => loginscreen()));
    // ignore: use_build_context_synchronouslye
  }

  bool isLoggedIn = true;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text("Ilham Ibnu Ahmad"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/bjorka.png")),
              accountEmail: Text("bjorka@ai.com"),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 29, 37),
              )),
          // DrawerListTile(
          //   icondata: Icons.contacts,
          //   title: "Contacts",
          //   onTilePressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const home()),
          //     );
          //   },
          // ),
          // DrawerListTile(
          //   icondata: Icons.shopping_bag,
          //   title: "Produk",
          //   onTilePressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const product()),
          //     );
          //   },
          // ),
          // DrawerListTile(
          //   icondata: Icons.bookmark_border,
          //   title: "Saved message",
          //   onTilePressed: () {},
          // ),
          // DrawerListTile(
          //   icondata: Icons.phone,
          //   title: "Calls",
          //   onTilePressed: () {},
          // ),
          // DrawerListTile(
          //   icondata: Icons.logout,
          //   title: "Minggu Ke 6",
          //   onTilePressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const calls()),
          //     );
          //   },
          // ),
          DrawerListTile(
            icondata: Icons.location_on_outlined,
            title: "Cari Kordinat",
            onTilePressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const geolocation()),
              );
            },
          ),
          DrawerListTile(
            icondata: Icons.location_on_rounded,
            title: "Cari Alamat",
            onTilePressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const geolator()),
              );
            },
          ),
          DrawerListTile(
            icondata: Icons.logout,
            title: "Log Out",
            onTilePressed: () {
              _signOut();
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => const loginscreen()),
              // );
            },
          ),
          // Divider(),
          // Padding(padding: EdgeInsets.only(top: 10)),
          // Text("    Labels",
          //     style: TextStyle(
          //       color: Colors.grey,
          //     )),
          // Padding(padding: EdgeInsets.only(top: 10)),
          // DrawerListTile(
          //   icondata: Icons.label,
          //   title: "Family",
          //   onTilePressed: () {},
          // ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icondata;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile(
      {Key? key,
      required this.icondata,
      required this.title,
      required this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(icondata),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
