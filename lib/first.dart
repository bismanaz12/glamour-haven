import 'package:beauty_app/product.dart';
import 'package:beauty_app/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xffD49246), Color(0xffC67416)]),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [Color(0xffD49246), Color(0xffC67416)]),
                    ),
                    child: Image.asset('assets/images/girl.png',
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ),
        Positioned(
            top: 90,
            left: 30,
            child: Text(
              'Elevate your\nskincare routine\nwith our app',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 40,
                fontFamily: 'Style',
              ),
            )),
        Positioned(
          top: 800,
          left: 30,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 5, 62, 56),
                  fixedSize: Size(350, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
              onPressed: () {
                Get.to(
                    () => FirebaseAuth.instance.currentUser != null
                        ? Product()
                        : Signup(),
                    transition: Transition.fade,
                    duration: Duration(seconds: 3));
              },
              child: Text(
                'GET STARTED',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontFamily: 'Font',
                  fontSize: 20,
                ),
              )),
        )
      ]),
    );
  }
}
