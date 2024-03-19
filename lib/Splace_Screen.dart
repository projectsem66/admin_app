
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
    return Scaffold(
      backgroundColor: AppColors.Colorq.withOpacity((0.7)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("images/adminLogo.png"),
                    fit: BoxFit.cover
                ),

              ),

            ),
            SizedBox(height: 20),
            Text(
                'City Serve',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
            ),
          ],
        ),
      ),
    );
  }
}
