import 'package:anjayani/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class registerscreen extends StatefulWidget {
  const registerscreen({super.key});

  @override
  State<registerscreen> createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool checked = true;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerSubmit() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text.toString().trim(),
          password: _passwordController.text);
    } catch (e) {
      print(e);
      SnackBar(
        content: Text(e.toString()),
      );
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => loginscreen()));
  }

  // loginSumbimt() async {
  //   try {
  //     _firebaseAuth
  //         .signInWithEmailAndPassword(
  //             email: _emailController.text, password: _passwordController.text)
  //         .then((value) => Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(builder: (context) => HomeScreen())));
  //   } catch (e) {
  //     print(e);
  //     SnackBar(
  //       content: Text(e.toString()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginscreen()));
                },
              ),
            ),
            Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: ExactAssetImage('assets/img/register.png'),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10),
              child: const Text(
                "Silahkan isi form pendaftaran dibawah ini dengan benar dan tepat",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 5),
              child: const Text(
                "Create Your Account",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              // child: const Text(
              //   "Username",
              //   style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              // ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              // child: const Text(
              //   "Password",
              //   style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              // ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
            ),
            CheckboxListTile(
              title: Text(
                'Saya menyetujui syarat, ketentuan, dan privasi Finham',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              value: checked,
              activeColor: Color.fromARGB(255, 16, 29, 37),
              onChanged: (value) {
                print(value);
                setState(() {
                  checked = true;
                });
              },
            ),
            Container(
              height: 85,
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  String username = _emailController.text;
                  String pass = _passwordController.text;
                  if (username == "" && pass == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Username harus dengan @ dan password 8 digit")));
                  } else {
                    registerSubmit();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginscreen()));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 16, 29, 37)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 14),
                ),
                TextButton(
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginscreen()));
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 16, 29, 37)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
