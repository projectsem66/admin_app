import 'dart:html';

import 'package:admin_app/section.dart';
import 'package:admin_app/simple.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:bounce/bounce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer_page/drawe_subpage/category_list.dart';
import 'drawer_page/drawe_subpage/subCategory_list.dart';

class sectionlist extends StatefulWidget {
  final String categoryTitle;
  const sectionlist({super.key,required this.categoryTitle});

  @override
  State<sectionlist> createState() => _sectionlistState();
}

class _sectionlistState extends State<sectionlist> {
  Stream<QuerySnapshot<Object?>> getsection() {
    return FirebaseFirestore.instance
        .collection('category')
        .doc(widget.categoryTitle)
        .collection("subcategories")
        .snapshots();
  }
  final CollectionReference refC =
  FirebaseFirestore.instance.collection('category');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        leading: IconButton(
          onPressed: () {
            // Get.to(home_page());
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: dimension.icon30,
          ),
        ),
        title: Text("Section",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: dimension.height15),
            child: GestureDetector(
              onTap: () {
                Get.to(Section());
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
                  stream: getsection(),
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
                                      color: AppColors.Colorq.withOpacity(0.05),
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
                                                  fontWeight: FontWeight.bold)),
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
                                                  onTap: () {
                                            //_update(documentSnapshot),
                                            },
                                                  child: Container(
                                                    height: dimension.height35,
                                                    width: dimension.height35,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                        AppColors.Colorq),
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Bounce(
                                                  onTap: () {
                                                    // _delete(
                                                    //     documentSnapshot.id),
                                                  },
                                                  child: Container(
                                                    height: dimension.height35,
                                                    width: dimension.height35,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
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
    );
  }
}
