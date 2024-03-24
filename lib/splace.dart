
import 'dart:developer';

import 'package:admin_app/Splace_service.dart';
import 'package:flutter/material.dart';




class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  splashServices splashScreen = splashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context).then((value) {
      setState(() {
        //log(userEmail);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          color: Colors.white,

          image: DecorationImage(image: AssetImage("images/2.gif"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
