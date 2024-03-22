
import 'dart:developer';


import 'package:admin_app/Splace_service.dart';
import 'package:admin_app/util/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




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
    return  Scaffold(
      body: Center(
        child: Container(

          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
            color: Colors.white,

            image: DecorationImage(image: AssetImage("images/admiN.gif"),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
