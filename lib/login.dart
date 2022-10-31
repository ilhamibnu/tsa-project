import 'package:anjayani/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:anjayani/pages/home.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Username menggunakan @ dan Password harus 8 digit")));
      // SnackBar(
      //   content: Text(e.toString()),
      // );
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => loginscreen()));
  }

  loginSumbimt() async {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => home())));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Username atau password salah")));
      // SnackBar(
      //   content: Text(e.toString()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: ExactAssetImage('assets/img/login.png'),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10),
              child: const Text(
                "Silahkan masuk menggunakan username dan password anda",
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
                "Login",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 19),
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
            Container(),
            Container(
              height: 85,
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  String username = _emailController.text;
                  String pass = _passwordController.text;
                  if (username == "" && pass == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Username atau password salah")));
                  } else {
                    loginSumbimt();
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
                  "Does not have account?",
                  style: TextStyle(fontSize: 14),
                ),
                TextButton(
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => registerscreen())),
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
