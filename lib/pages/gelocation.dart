import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'geolocator.dart';

class geolocation extends StatelessWidget {
  const geolocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Cari Kordinat Bos'),
        //   backgroundColor: Color.fromARGB(255, 16, 29, 37),
        // ),
        body: geoaja());
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Setting"),
//         backgroundColor: Color.fromARGB(255, 16, 29, 37),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(Icons.search),
//           )
//         ],
//       ),
//       body: Center(
//           child: Text(
//         'Setting kosong bro, males garap',
//         style: TextStyle(fontSize: 25),
//       )),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(
//           Icons.create,
//           color: Colors.white,
//         ),
//         backgroundColor: Color.fromARGB(255, 16, 29, 37),
//         onPressed: () {},
//       ),
//     );
//   }
// }

// class geoanjay extends StatefulWidget {
//   const geoanjay({Key? key}) : super(key: key);
//   @override
//   State<geoanjay> createState() => _geoanjayState();
// }

// class _geoanjayState extends State<geoanjay> {
//   int _counter = 0;
//   Position _myPosition = Position(
//       longitude: 0,
//       latitude: 0,
//       timestamp: DateTime.now(),
//       accuracy: 0,
//       altitude: 0.0,
//       heading: 0.0,
//       speed: 0.0,
//       speedAccuracy: 0.0);

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '$_myPosition',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color.fromARGB(255, 16, 29, 37),
//         onPressed: _determinePosition,
//         tooltip: 'Increment',
//         child: const Icon(
//           Icons.location_on,
//           color: Color.fromARGB(255, 255, 255, 255),
//         ),
//       ),
//     );
//   }

//   Future<void> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services belum aktif.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions ditolak');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions ditolak, gagal request permissions.');
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     // return await Geolocator.getCurrentPosition();
//     Position myPosition = await Geolocator.getCurrentPosition();
//     setState(() => _myPosition = myPosition);
//   }
// }

class geoaja extends StatefulWidget {
  geoaja({Key? key}) : super(key: key);

  @override
  State<geoaja> createState() => _geoajaState();
}

class _geoajaState extends State<geoaja> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => MyApp()));
    // ignore: use_build_context_synchronouslye
  }

  //get location
  int _counter = 0;

  String location = 'Belum Mendapatkan Lat dan long, Silahkan tekan button';
  String address = 'Mencari lokasi...';
  //getLongLAT
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //location service not enabled, don't continue
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service Not Enabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    //permission denied forever
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permission denied forever, we cannot access',
      );
    }
    //continue accessing the position of device
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Firebase"),
      //   backgroundColor: Color.fromARGB(255, 16, 29, 37),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.exit_to_app),
      //       onPressed: _signOut,
      //     ),
      //   ],
      // ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Koordinat Point",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              location,
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'address',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text('${address}'),
            ElevatedButton(
              onPressed: () async {
                Position position = await _getGeoLocationPosition();
                setState(() {
                  location = '${position.latitude}, ${position.longitude}';
                });
                getAddressFromLongLat(position);
              },
              style: ElevatedButton.styleFrom(primary: Colors.black),
              child: const Text('Get Koordinat'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 16, 29, 37),
        child: const Icon(
          Icons.location_on,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 20,
        ),
        onPressed: () {
          final intent = AndroidIntent(
              action: 'action_view',
              data: Uri.encodeFull(
                  'google.navigation:1=Tarongo+Zoo,+Sydney+Australia&avoid=tf'),
              package: 'com.google.android.apps.maps');
          intent.launch();
        },
      ),
    );
  }

  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }
}
