import 'dart:developer';
import 'dart:io';

import 'package:admin_app/section_list.dart';
import 'package:admin_app/subcetegory.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:bounce/bounce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../simple.dart';
import '../../util/color.dart';
import 'category_list.dart';

class SubCategoryList extends StatefulWidget {
  final String categoryTitle;

  const SubCategoryList({super.key, required this.categoryTitle});

  @override
  State<SubCategoryList> createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  Stream<QuerySnapshot<Object?>> getSubCategory() {
    return FirebaseFirestore.instance
        .collection('category')
        .doc(widget.categoryTitle)
        .collection("subcategories")
        .snapshots();
  }

  final TextEditingController _namecontroller = TextEditingController();
  File? pickedImage;

  Future<void> deleteSC(String documentId) async {
    try {
      CollectionReference subcategoriesRef = FirebaseFirestore.instance
          .collection('category')
          .doc(widget.categoryTitle)
          .collection("subcategories");

      DocumentReference docRefToDelete = subcategoriesRef.doc(documentId);

      await docRefToDelete.delete();

      print('ID $documentId deletee');
    } catch (e) {
      print('Error $e');
    }
  }

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
        .collection('category')
        .doc(widget.categoryTitle)
        .collection("subcategories")
        .doc(snapid)
        .set({"scname": _namecontroller.text.toString(), "scimage": url}).then(
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

  final CollectionReference refSC = FirebaseFirestore.instance
      .collection("category")
      .doc(categoryName)
      .collection('subcategories');

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

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _namecontroller.text = documentSnapshot['scname'];

      imgPath = documentSnapshot['scimage'];
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
            padding:  EdgeInsets.only(top: dimension.height15),
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
                              height: dimension.height100+20,
                              width: dimension.height100+20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(pickedImage!),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq.withOpacity(0.05)),
                            )
                          : Container(
                              height: dimension.height100+20,
                              width: dimension.height100+20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imgPath),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  color: AppColors.Colorq.withOpacity(0.05)),
                            ),
                      Container(
                        margin: EdgeInsets.only(top: dimension.height65, left: dimension.height80),
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
                      labelText: 'Name',
                      hintText: "Umang m patel",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(dimension.radius15)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(dimension.radius15),
                          borderSide: BorderSide(color: AppColors.Colorq)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(dimension.radius15),
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
                    //
                    //       await refC
                    //           .doc(documentSnapshot!.id)
                    //           .update({"scname": name});
                    //       _namecontroller.text = '';
                    //
                    //       Get.back();
                    //     },
                    //     child: const Text(
                    //       "Update",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, color: Colors.black),
                    //     )),
                    Bounce(
                      duration: Duration(milliseconds: 200),
                      onTap: () async {
                        print("00000000000000000000000000000");
                        print(snapid);
                        final String name = _namecontroller.text;
                        final String url = imgPath.toString();
                        addcategory(_namecontroller.text);
                        await refSC
                            .doc(snapid)
                            .update({"scname": name, "scimage": url});
                        Get.back();
                      },
                      child: Container(
                        height: dimension.height55,
                        width: dimension.height100+20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(dimension.radius15),
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

  // final CollectionReference refSC =
  // FirebaseFirestore.instance.collection('category')
  //     .doc(widget.categoryTitle)
  //     .collection("subcategories");

  // Future<void> _delete(String documentId) async {
  //   try {
  //     DocumentReference refSC = FirebaseFirestore.instance
  //         .collection('subcategories')
  //         .doc(documentId);
  //
  //     await refSC.delete();
  //
  //     print('Document deleted successfully!');
  //   } catch (e) {
  //     print('Error deleting document: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        leading: IconButton(
          onPressed: () {
            Get.to(categorylist());
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: dimension.icon30,
          ),
        ),
        title: Text(widget.categoryTitle,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: dimension.height15),
            child: GestureDetector(
              onTap: () {
                categoryNamee = widget.categoryTitle;
                Get.to(sub_category());
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
        padding: EdgeInsets.only(left: dimension.height12, right: dimension.height12, top: dimension.height15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenheight() - 95,
                child: StreamBuilder(
                  stream: getSubCategory(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return GridView.builder(
                        itemCount: streamSnapshot.data!.docs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0.5,
                            crossAxisSpacing: 0.5,
                            childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                          return Padding(
                            padding: EdgeInsets.all(dimension.height8),
                            child: Bounce(
                              onTap: () {
                                categoryName = documentSnapshot.id;

                                // Get.to(sectionlist(
                                //   categoryTitle: documentSnapshot.id,
                                // ));

                              },
                              duration: Duration(milliseconds: 200),
                              child: Container(
                                decoration: BoxDecoration(
                                    //  color: Colors.black,
                                    borderRadius: BorderRadius.circular(dimension.radius15)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: dimension.height70*2,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(dimension.radius15),
                                              topLeft: Radius.circular(dimension.radius15)),
                                          // color: Colors.red,
                                          color: AppColors.Colorq.withOpacity(
                                              0.05),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  documentSnapshot['scimage']
                                                      .toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                    Container(
                                      height: dimension.height83,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(dimension.radius15),
                                              bottomLeft: Radius.circular(dimension.radius15)),
                                          color: AppColors.Colorq.withOpacity(
                                              0.05)),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: dimension.height10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                documentSnapshot['scname']
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Padding(
                                              padding:  EdgeInsets.only(
                                                  bottom: dimension.height10,
                                                  left: dimension.height20,
                                                  right: dimension.height20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Bounce(
                                                    duration: Duration(
                                                        milliseconds: 200),
                                                    onTap: () {
                                                      snapid =
                                                          documentSnapshot.id;
                                                      _update(documentSnapshot);
                                                    },
                                                    child: Container(
                                                      height: dimension.height35,
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
                                                    onTap: () async {
                                                      await deleteSC(
                                                          documentSnapshot.id);
                                                    },
                                                    child: Container(
                                                      height: dimension.height35,
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
