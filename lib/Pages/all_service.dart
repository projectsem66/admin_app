import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/Pages/servise_description.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class allservice extends StatefulWidget {
  const allservice({super.key});

  @override
  State<allservice> createState() => _allserviceState();
}

class _allserviceState extends State<allservice> {
  final CollectionReference refpro =
  FirebaseFirestore.instance.collection('providerServiceDetails');

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
            title: Text("All Services",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: dimension.font20)),
          ),
          body: WillPopScope(
            child: Padding(
              padding: EdgeInsets.only(
                  top: dimension.height15,
                  left: dimension.height12,
                  right: dimension.height12),
              child: Column(
                children: [
                  StreamBuilder(
                    stream: refpro.snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0.5,
                                crossAxisSpacing: 0.5,
                                childAspectRatio: 0.55),
                            itemCount: streamSnapshot.data!.docs.length,
                            //  scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                              streamSnapshot.data!.docs[index];
                              return Stack(
                                children: [
                                  Container(
                                    height: dimension.height100 * 3 + 2,
                                    width: dimension.height100 + 72,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          dimension.height15),
                                      //color: Colors.green
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // ani click per service desc page open karavvu
                                            documentSnapshot.id;

                                            Get.to(ServiceDescription(
                                              serviceId: documentSnapshot.id,
                                            ));
                                          },
                                          child: Container(
                                            height: dimension.height100 * 2,
                                            width: dimension.height100 + 67,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      documentSnapshot['images']
                                                          .toString()),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      dimension.height15),
                                                  topLeft: Radius.circular(
                                                      dimension.height15)),
                                              //  color: Colors.green,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: dimension.height100,
                                          width: dimension.height100 + 67,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight: Radius.circular(
                                                      dimension.radius15),
                                                  bottomLeft: Radius.circular(
                                                      dimension.radius15)),
                                              color:
                                              AppColors.Colorq.withOpacity(
                                                  0.08)),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: dimension.height15,
                                                    left: dimension.height10),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: dimension.height10,
                                                    right: dimension.height10),
                                                child: Text(
                                                    documentSnapshot[
                                                    'serviceName']
                                                        .toString(),
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    maxLines: 2,

                                                    style: GoogleFonts.poppins(
                                                        color: AppColors.Colorq,
                                                        fontSize:
                                                        dimension.height13,
                                                        fontWeight:
                                                        FontWeight.w500)),
                                              ),
                                           Spacer(),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left:
                                                        dimension.height10),
                                                    child: Container(
                                                      height:
                                                      dimension.height25,
                                                      width: dimension.height25,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                          BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  documentSnapshot[
                                                                  'providerImage']
                                                                      .toString()),
                                                              fit: BoxFit
                                                                  .cover)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: dimension.height7,
                                                  ),
                                                  Text(
                                                      documentSnapshot[
                                                      'providerName']
                                                          .toString(),
                                                      style:
                                                      GoogleFonts.poppins(
                                                          color: AppColors
                                                              .Colorq,
                                                          fontSize:
                                                          dimension
                                                              .font10,
                                                          fontWeight:
                                                          FontWeight
                                                              .w300)),
                                                ],
                                              ),
                                              SizedBox(height: dimension.height7,)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: dimension.height100 + 83,
                                        left: dimension.height73),
                                    height: dimension.height30,
                                    width: dimension.height85,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            dimension.height15),
                                        border: Border.all(
                                            color: AppColors.Colorq,
                                            width: dimension.height2),
                                        color: AppColors.white1),
                                    child: Center(
                                        child: Text(
                                            "₹${documentSnapshot['servicePrice']}"
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontWeight: FontWeight.w500,
                                                fontSize: dimension.font15))),
                                  )
                                ],
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
                  // SizedBox(
                  //   width: dimension.height5,
                  // ),
                ],
              ),
            ),
            onWillPop: () async {
              print("Tapped");
              setState(() {
                Get.off(home_page());
              });
              return false;
            },
          )),
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
