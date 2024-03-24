import 'dart:developer';
import 'dart:io';

import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/section.dart';
import 'package:admin_app/simple.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class sub_category extends StatefulWidget {
  const sub_category({super.key});

  @override
  State<sub_category> createState() => _sub_categoryState();
}

String SCname = "";

class _sub_categoryState extends State<sub_category> {
  File? pickedSCimg;
  TextEditingController _scName = TextEditingController();

  addSubCategory(String cName) async {
    if (cName == null && pickedSCimg == null) {
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
    UploadTask uploadtask = FirebaseStorage.instance
        .ref("Category img")
        .child(_scName.text.toString())
        .putFile(pickedSCimg!);
    TaskSnapshot taskSnapshot = await uploadtask;
    String url = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("category")
        .doc(categoryNamee)
        .collection("subcategories")
        .doc(_scName.text.toString())
        .set({
      "scname": _scName.text.toString(),
      "scimage": url.toString()
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
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.to(simple());
              },
              child: Icon(Icons.arrow_back)),
          backgroundColor: AppColors.Colorq,
          centerTitle: false,
          title: Text("Add Sub Category",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: dimension.height20,
                  fontWeight: FontWeight.w400)),
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
              Text("Category Name: ${categoryNamee}",
                  style: GoogleFonts.poppins(
                      color: AppColors.Colorq,
                      fontSize: dimension.height14,
                      fontWeight: FontWeight.w400)),
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
                                        image: AssetImage(
                                            "images/addCategoryy.png"),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                    color: AppColors.Colorq.withOpacity(0.05)),
                              ),
                        Container(
                          margin: EdgeInsets.only(
                              top: dimension.height65,
                              left: dimension.height80),
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
                controller: _scName,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.Colorq.withOpacity(0.05),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(dimension.radius15)),
                  //  hintText: "Enter SubCategory",
                  labelText: "Enter Sub Category",
                  labelStyle: TextStyle(color: Colors.black87),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: AppColors.Colorq),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(
                height: dimension.height20,
              ),
              GestureDetector(
                onTap: () {
                  subCategoryNameForSection = _scName.text.toString();
                  addSubCategory(_scName.text.toString());
                  SCname = _scName.text.toString();
                  Get.to(Section());
                },
                child: Container(
                  height: dimension.height50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(dimension.radius7),
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
      ),
      onWillPop: () async {
        print("Tapped");
        setState(() {
          Get.off(home_page());
        });
        return false;
      },
    );
  }
}
