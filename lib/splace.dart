import 'package:admin_app/FAVRATE.dart';
import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/util/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void navigateToNextPage() {
      Future.delayed(Duration(seconds: 7), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    }

     navigateToNextPage();

    return Scaffold(
      backgroundColor: AppColors.Colorq.withOpacity((0.7)), // Set your desired background color
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