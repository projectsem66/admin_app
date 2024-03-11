import 'package:admin_app/drawer_page/drawe_subpage/category_list.dart';
import 'package:admin_app/simple.dart';
import 'package:admin_app/subcetegory.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class section extends StatefulWidget {
  const section({super.key});

  @override
  State<section> createState() => _sectionState();
}

class _sectionState extends State<section> {
  addSubCategory(String secName) async {
    if (secName == null) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter Required Field"),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Ok")),
            ],
          );
        },
      );
    } else {
      uploadSubCategory();
    }
  }

  uploadSubCategory() async {
    FirebaseFirestore.instance
        .collection("category")
        .doc(categoryNamee)
        .collection("subcategories")
        .doc(sectionn)
        .collection("section")
        .doc(_section.text.toString())
        .set({
      "section": _section.text.toString(),
    }).then(
      (value) {
        print("Section is added");
      },
    );
  }

  final TextEditingController _section = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        leading: IconButton(
          onPressed: () {
        //    Get.to(categorylist());
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: dimension.icon30,
          ),
        ),
        title: Text("Section",
            //widget.categoryTitle,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: dimension.height15),
            child: GestureDetector(
              onTap: () {
                // categoryNamee = widget.categoryTitle;
               // Get.to(sub_category());
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("SybCategory Name: ${sectionn}"),
          SizedBox(
            height: dimension.height15,
          ),
          TextFormField(
            controller: _section,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.Colorq.withOpacity(0.05),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(dimension.radius15)),
                hintText: "Enter the Section",
                labelText: "Enter the Section",
                labelStyle: TextStyle(color: Colors.black87),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(dimension.radius15),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.Colorq),
                    borderRadius: BorderRadius.circular(dimension.radius15))),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              addSubCategory(_section.text.toString());

              Get.to(categorylist());
            },
            child: Container(
              height: dimension.height60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimension.radius15),
                  color: AppColors.Colorq),
              child: Center(
                child: Text(
                  "Next",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontSize: dimension.font22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
