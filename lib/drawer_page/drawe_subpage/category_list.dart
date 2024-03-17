import 'dart:developer';
import 'dart:io';

import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/drawer_page/drawe_subpage/subCategory_list.dart';
import 'package:admin_app/simple.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:bounce/bounce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../section.dart';

class categorylist extends StatefulWidget {
  categorylist({super.key});

  @override
  State<categorylist> createState() => _categorylistState();
}

String categoryName = "";

class _categorylistState extends State<categorylist> {
  File? pickedImage;

  addcategory(String cName) async {
    if (cName == null && pickedImage == null) {
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
      uploadData();
    }
  }

  uploadData() async {
    UploadTask uploadtask = FirebaseStorage.instance
        .ref("Category img")
        .child("${_namecontroller.text}")
        .putFile(pickedImage!, SettableMetadata(contentType: 'image/jpeg'));
    TaskSnapshot taskSnapshot = await uploadtask;
    String url = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("category")
        .doc(snapid)
        .set({"cname": _namecontroller.text.toString(), "cimage": url}).then(
            (value) {
      log("User Uploaded");
    });
    // await _collectionReference
    //     .doc(_cname.toString())
    //     .set({"cname": _cname.text.toString(), "cimage": url}).then(
    //   (value) {
    //     print("data Added");
    //   },
    // );
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

  String imgPath = "";
  String snapid = "";

  final TextEditingController _namecontroller = TextEditingController();

  final CollectionReference refC =
      FirebaseFirestore.instance.collection('category');

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _namecontroller.text = documentSnapshot['cname'];
      snapid = documentSnapshot.id;
      imgPath = documentSnapshot['cimage'];
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: dimension.height20,
              left: dimension.height20,
              right: dimension.height20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
          child: Padding(
            padding: EdgeInsets.only(top: dimension.height15),
            child: Column(
              children: [
                Center(
                  child: Text("Update your Items",
                      style: TextStyle(
                          color: AppColors.Colorq,
                          fontWeight: FontWeight.bold,
                          fontSize: dimension.font20)),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                GestureDetector(
                  onTap: () {
                    showAlertBox();
                  },
                  child: Stack(
                    children: [
                      pickedImage != null
                          ? Container(
                              height: dimension.height60 * 2,
                              width: dimension.height60 * 2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(pickedImage!),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq.withOpacity(0.05)),
                            )
                          : Container(
                              height: dimension.height60 * 2,
                              width: dimension.height60 * 2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imgPath),
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
                SizedBox(
                  height: dimension.height30,
                ),
                TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                      labelText: 'Enter Category name',
                      hintText: "Enter Categoty name",
                      labelStyle: TextStyle(color: AppColors.Colorq),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(dimension.radius15)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(dimension.radius15),
                          borderSide: BorderSide(color: AppColors.Colorq)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(dimension.radius15),
                          borderSide: BorderSide(color: AppColors.Colorq))),
                ),
                SizedBox(
                  height: dimension.height20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ElevatedButton(
                    //     onPressed: () async {
                    //       final String name = _namecontroller.text;
                    //       final String url = imgPath.toString();
                    //       addcategory(_namecontroller.text);
                    //       await refC
                    //           .doc(documentSnapshot!.id)
                    //           .update({"cname": name});
                    //       //_namecontroller.text = '';
                    //
                    //       //addcategory(_namecontroller.text.toString());
                    //       // categoryNamee = _cname.text.toString();
                    //       Navigator.of(context).pop();
                    //       // setState(() {
                    //       //
                    //       // });
                    //     },
                    //     child: const Text(
                    //       "Update",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, color: Colors.black),
                    //     )),
                    InkWell(
                      onTap: () async {
                        final String name = _namecontroller.text;
                        final String url = imgPath.toString();
                        addcategory(_namecontroller.text);
                        await refC
                            .doc(documentSnapshot!.id)
                            .update({"cname": name});
                        //_namecontroller.text = '';

                        //addcategory(_namecontroller.text.toString());
                        // categoryNamee = _cname.text.toString();
                        Navigator.of(context).pop();
                        // setState(() {
                        //
                        // });
                      },
                      child: Container(
                        height: dimension.height55,
                        width: dimension.height60 * 2,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dimension.radius15),
                            color: AppColors.Colorq),
                        child: Center(
                          child: Text(
                            "Update",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: dimension.font20),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _delete(String productID) async {
    await refC.doc(productID).delete();

    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("you have successfully deleted a items")));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.Colorq,
          leading: IconButton(
            onPressed: () {
              Get.to(home_page());
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: dimension.icon30,
            ),
          ),
          title: Text("Category",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: dimension.font20)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: dimension.height15),
              child: GestureDetector(
                onTap: () {
                  Get.to(simple());
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: dimension.height12,
              right: dimension.height12,
              top: dimension.height15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screenheight() - 95,
                  child: StreamBuilder(
                    stream: refC.snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return GridView.builder(
                          itemCount: streamSnapshot.data!.docs.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 0.5,
                                  crossAxisSpacing: 0.5,
                                  childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return Padding(
                              padding: EdgeInsets.all(dimension.height8),
                              child: Container(
                                decoration: BoxDecoration(
                                    //color: Colors.orange,

                                    borderRadius: BorderRadius.circular(
                                        dimension.radius15)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Bounce(
                                      onTap: () async {
                                        categoryName = documentSnapshot.id;
                                        categoryNameForSection =
                                            documentSnapshot.id;
                                        Get.to(SubCategoryList(
                                          categoryTitle: documentSnapshot.id,
                                        ));
                                      },
                                      duration: Duration(milliseconds: 200),
                                      child: Container(
                                        height: dimension.height70 * 2,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    dimension.radius15),
                                                topLeft: Radius.circular(
                                                    dimension.radius15)),
                                            color: AppColors.Colorq.withOpacity(
                                                0.09),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    documentSnapshot['cimage']
                                                        .toString()),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Container(
                                      height: dimension.height83,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(
                                                dimension.radius15),
                                            bottomLeft: Radius.circular(
                                                dimension.radius15)),
                                        color:
                                            AppColors.Colorq.withOpacity(0.05),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: dimension.height10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                documentSnapshot['cname']
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: dimension.height10,
                                                  left: dimension.height20,
                                                  right: dimension.height20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Bounce(
                                                    onTap: () => _update(
                                                        documentSnapshot),
                                                    child: Container(
                                                      height:
                                                          dimension.height35,
                                                      width: dimension.height35,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              AppColors.Colorq),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Bounce(
                                                    onTap: () => _delete(
                                                        documentSnapshot.id),
                                                    child: Container(
                                                      height:
                                                          dimension.height35,
                                                      width: dimension.height35,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              AppColors.Colorq),
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async{
        print("Tapped");
        setState(() {
          Get.off(home_page());
        });
        return false;
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
        pickedImage = tempImage;
      });
    } catch (ex) {
      log(ex.toString());
      print(ex.toString());
    }
  }
}
