import 'package:admin_app/simple.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class sub_category extends StatefulWidget {
  const sub_category({super.key});

  @override
  State<sub_category> createState() => _sub_categoryState();
}

class _sub_categoryState extends State<sub_category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        leading: IconButton(
          onPressed: () {
            Get.to(simple());
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: dimension.icon30,
          ),
        ),
        title: Text("Add Sub Category",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.Colorq.withOpacity(0.05),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                hintText: "Salon for Men",
                labelText: "Category Name",
                labelStyle: TextStyle(color: Colors.black87),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.Colorq),
                    borderRadius: BorderRadius.circular(15))),
          ),
          SizedBox(height: 15,),
          Stack(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.Colorq.withOpacity(0.05)),
              ),
              Container(
                margin: EdgeInsets.only(top: 65, left: 80),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //   color: AppColors.Colorq
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: 30,
                    Icons.camera_enhance,
                    color: AppColors.Colorq,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.Colorq.withOpacity(0.05),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                hintText: "Salon for Men",
                labelText: "Category Name",
                labelStyle: TextStyle(color: Colors.black87),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.Colorq),
                    borderRadius: BorderRadius.circular(15))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.to(sub_category());
            },
            child: Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.Colorq),
              child: Center(
                child: Text(
                  "Next",
                  style:
                  GoogleFonts.poppins(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
