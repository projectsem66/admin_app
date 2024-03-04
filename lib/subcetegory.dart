import 'dart:developer';
import 'dart:io';
import 'package:admin_app/drawer_page/drawe_subpage/category_list.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        leading: IconButton(
          onPressed: () {
            //  Get.to(simple());
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
          Text("Category: ${categoryNamee}"),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              showAlertBox();
            },
            child: Stack(
              children: [
                pickedSCimg != null
                    ? Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(pickedSCimg!),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            color: AppColors.Colorq.withOpacity(0.05)),
                      )
                    : Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/addCategoryy.png"),
                                fit: BoxFit.cover),
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
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _scName,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.Colorq.withOpacity(0.05),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Salon for Men",
                labelText: "Sub Category Name",
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
              addSubCategory(_scName.text.toString());
              Get.to(categorylist());
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
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
