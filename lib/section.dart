import 'dart:developer';
import 'dart:io';

import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/drawer_page/drawe_subpage/category_list.dart';
import 'package:admin_app/section.dart';
import 'package:admin_app/simple.dart';
import 'package:admin_app/subcetegory.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'drawer_page/drawe_subpage/subCategory_list.dart';

class Section extends StatefulWidget {
  const Section({super.key});

  @override
  State<Section> createState() => _Section_State();
}
String Sectionname = "";
// String sectionn = "";
String categoryNameForSection="";
String subCategoryNameForSection="";

class _Section_State extends State<Section> {

  File? pickedSCimg;
  TextEditingController _SName = TextEditingController();

  addSection(String SName) async {
    if (SName == null && pickedSCimg == null) {
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
              //NEW CATEGORY ADD KR TU KR HU JOV

            ],
          );
        },
      );
    } else {
      uploadSection();
    }
  }



  uploadSection() async {
    UploadTask uploadtask = FirebaseStorage.instance
        .ref("Category img")
        .child(_SName.text.toString())
        .putFile(pickedSCimg!);
    TaskSnapshot taskSnapshot = await uploadtask;
    String url = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("category")
        .doc(categoryNameForSection)
        .collection("subcategories")
        .doc(subCategoryNameForSection)
        .collection("sections").doc(_SName.text.toString())
        .set({
      "sname": _SName.text.toString(),
      "simage": url.toString()
    }).then(
      (value) {
        print("sub category data added");
      },
    );
  }

  showAlertBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pick Image From"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  pickImage(ImageSource.camera);
                  Get.back();
                },
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
              ),
              ListTile(
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Get.back();
                },
                leading: Icon(Icons.image),
                title: Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) {
        return;
      }
      final tempImage = File(photo.path);
      setState(() {
        pickedSCimg = tempImage;
      });
    } catch (ex) {
      log(ex.toString());
      print(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        leading: IconButton(
          onPressed: () {
            Get.to(sub_category());
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: dimension.icon30,
          ),
        ),
        title: Text("Add Section",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: dimension.font20)),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: dimension.height12,
            right: dimension.height12,
            top: dimension.height15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SubCategory Name: ${SCname}"),
            Text("Category Name:  ${categoryNamee}"),
            SizedBox(
              height: dimension.height15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showAlertBox();
                  },

                  child: Stack(
                    children: [
                      pickedSCimg != null
                          ? Container(
                        height: dimension.height100 + 20,
                        width: dimension.height100 + 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(pickedSCimg!),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: AppColors.Colorq.withOpacity(0.05)),
                      )
                          : Container(
                        height: dimension.height100 + 20,
                        width: dimension.height100 + 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                AssetImage("images/addCategoryy.png"),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: AppColors.Colorq.withOpacity(0.05)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: dimension.height65, left: dimension.height80),
                        height: dimension.height50,
                        width: dimension.height50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //   color: AppColors.Colorq
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            size: dimension.icon30,
                            Icons.camera_enhance,
                            color: AppColors.Colorq,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: dimension.height15,
            ),
            TextFormField(
              controller: _SName,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.Colorq.withOpacity(0.05),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(dimension.radius15)),
                  hintText: "Enter the section",
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
              height: dimension.height20,
            ),
            GestureDetector(
              onTap: () {
                addSection(_SName.text.toString());
                Sectionname = _SName.text.toString();
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
      ),
    ),  onWillPop: () async{
      print("Tapped");
      setState(() {
        Get.off(home_page());
      });
      return false;
    }, );
  }
}
