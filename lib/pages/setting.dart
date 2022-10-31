import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: Color.fromARGB(255, 16, 29, 37),
      ),
      body: Center(
        child: Text(
          'Setting kosong bro, males garap',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
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
//         onPressed: _determinePosition,
//         tooltip: 'Increment',
//         child: const Icon(Icons.location_on),
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
