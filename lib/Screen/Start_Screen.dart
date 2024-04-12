import 'package:flutter/material.dart';
import 'package:motion/Screen/home.dart';
import 'package:motion/widgets/MyButton.dart';
import 'package:motion/widgets/text.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;
  bool checkTheBox = false;

  void showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  void check() {
    setState(() {
      checkTheBox = !checkTheBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 1, 75),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 60),
              Text("WELCOME TO MOTION", style: TextStyle(
                color: Color.fromARGB(255, 2, 251, 43),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,),
              SizedBox(height: 60,),
              Image.asset(
                "assets/images/logo.png",
                width: 200,
              ),
             
              SizedBox(height: 100),
              MyButton(
                customColor: Color.fromARGB(255, 0, 236, 114),
                text: "Login",
                onTap: () {
                  // Navigasi ke HomeScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              MyButton(
                customColor: Color.fromARGB(255, 141, 141, 141),
                text: "Sign up",
                onTap: () {
                  // Navigasi ke HomeScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}