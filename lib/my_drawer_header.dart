import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHederDrawer extends StatefulWidget {
  const MyHederDrawer({super.key});

  @override
  State<MyHederDrawer> createState() => _MyHederDrawerState();
}

class _MyHederDrawerState extends State<MyHederDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.Colorq,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:  Colors.white54,
                image: DecorationImage(
                    image: AssetImage("images/pexels-hamed-gharaee-2117283.jpg"),
                    fit: BoxFit.cover)),
          ),
          Text(
            "Umang Patel",
            style: GoogleFonts.poppins(
                color: Colors.white60,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20),
          ),
          Text(
            "up2181@gmail.com",
            style: GoogleFonts.poppins(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font14),
          ),
        ],
      ),
    );
  }
}
