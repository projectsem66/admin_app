import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawer_page/drawer.dart';

class providerList extends StatefulWidget {
  const providerList({super.key});

  @override
  State<providerList> createState() => _providerListState();
}

class _providerListState extends State<providerList> {
  final CollectionReference refpro =
  FirebaseFirestore.instance.collection('providerDetails');
  Future<void> _delete(String productID) async {
    await refpro.doc(productID).delete();

    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("you have successfully deleted a items")));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: dimension.icon30),
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
        title: Text("Provider List",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            StreamBuilder(
              stream: refpro.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0.5,
                          crossAxisSpacing: 0.5,
                          childAspectRatio: 0.770),
                      itemCount: streamSnapshot.data!.docs.length,
                      //  scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Container(
                          margin: EdgeInsets.all(dimension.height7),
                          height: dimension.height100 * 2 + 20,
                          width: dimension.height60 * 3,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(dimension.height12)),
                          child: Column(
                            children: [
                              Container(
                                height: dimension.height100 + 50,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            documentSnapshot['image']
                                                .toString()),
                                        fit: BoxFit.cover),
                                    color: AppColors.Colorq.withOpacity(0.09),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          dimension.height12,
                                        ),
                                        topRight: Radius.circular(
                                            dimension.height12))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: dimension.height15,
                                      top: dimension.height10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                  "Are you sure you want to delete provider?",
                                                  style: GoogleFonts.poppins(
                                                      color: AppColors.Colorq,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: dimension.font15),
                                                ),
                                                content: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onTap: (){
                                                        _delete(
                                                            documentSnapshot.id);
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 95,
                                                        decoration: BoxDecoration(
                                                            color: AppColors.Colorq,
                                                            borderRadius: BorderRadius.circular(15)),
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.done),
                                                            SizedBox(
                                                              width: 7,
                                                            ),
                                                            Text(
                                                              "Yes",
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: dimension.font20),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        // Get.to(home_page());
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 95,
                                                        decoration: BoxDecoration(
                                                            color: AppColors.Colorq,
                                                            borderRadius: BorderRadius.circular(15)),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.cancel),
                                                            SizedBox(
                                                              width: 7,
                                                            ),
                                                            Text(
                                                              "No",
                                                              style: GoogleFonts.poppins(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: dimension.font20),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: dimension.height40,
                                          width: dimension.height40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                              AppColors.Colorq.withOpacity(0.05)),
                                          child: Icon(
                                            Icons.power_settings_new_sharp,
                                            color: AppColors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: dimension.height70,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(dimension.height12),
                                      bottomRight:
                                          Radius.circular(dimension.height12)),
                                  color: AppColors.Colorq.withOpacity(0.05),
                                ),
                                child: Column(
                                  //  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      documentSnapshot['firstName'].toString(),
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontWeight: FontWeight.w500,
                                          fontSize: dimension.font15),
                                    ),
                                    SizedBox(
                                      height: dimension.height5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: dimension.height32,
                                          width: dimension.height32,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.05)),
                                          child: Icon(Icons.call,
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.9)),
                                        ),
                                        SizedBox(
                                          width: dimension.height15,
                                        ),
                                        Container(
                                          height: dimension.height32,
                                          width: dimension.height32,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.05)),
                                          child: Icon(Icons.email_outlined,
                                              color:
                                                  AppColors.Colorq.withOpacity(
                                                      0.9)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: dimension.height3,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}