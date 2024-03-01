import 'package:admin_app/util/dimension.dart';
import 'package:bounce/bounce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../simple.dart';
import '../../util/color.dart';

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
                // Get.to(couponadd());
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
        padding: EdgeInsets.only(left: 12, right: 12, top: 15),
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
                          childAspectRatio: 0.8),
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Bounce(
                            onTap: () {},
                            duration: Duration(milliseconds: 200),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            topLeft: Radius.circular(15)),
                                        // color: Colors.red,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                documentSnapshot['scimage']
                                                    .toString()),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    height: 74,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15)),
                                      color: Colors.blue,
                                    ),
                                    child: Center(
                                      child: Text(
                                          documentSnapshot['scname'].toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
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
    );
  }
}
