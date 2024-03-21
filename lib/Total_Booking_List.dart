import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Total_booking_List extends StatefulWidget {
  const Total_booking_List({super.key});

  @override
  State<Total_booking_List> createState() => _Total_booking_ListState();
}

class _Total_booking_ListState extends State<Total_booking_List> {
  final CollectionReference refpro =
      FirebaseFirestore.instance.collection('bookingg');

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
        title: Text("Bookings List",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),
      ),
      body: SingleChildScrollView(
        child: WillPopScope(child: Padding(
          padding:  EdgeInsets.only(top: dimension.height15),
          child: Column(
            children: [
              StreamBuilder(
                stream: refpro.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return Container(
                      height:screenheight(),
                      //   color: Colors.deepPurpleAccent,
                      child: ListView.builder(
                      shrinkWrap: true,
                        itemCount: streamSnapshot.data!.docs.length,
                         scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                     //   physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                          return Padding(
                            padding: EdgeInsets.only(
                                left: dimension.height12,
                                right: dimension.height12),
                            child: Padding(
                              padding:
                              EdgeInsets.only(bottom: dimension.height20),
                              child: Container(
                                height: dimension.height100 * 2 + 50,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(dimension.height15),
                                    border: Border.all(color: AppColors.Colorq)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: dimension.height18,
                                              left: dimension.height15),
                                          height: dimension.height100,
                                          width: dimension.height100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                dimension.height15),
                                            //color: Colors.green,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    documentSnapshot[
                                                    ' serviceImg']
                                                        .toString()),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: dimension.height15),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: dimension.height35,
                                                    width: dimension.height95,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            dimension
                                                                .height10),
                                                        color:
                                                        Colors.red.shade100),
                                                    child: Center(
                                                        child: Text(
                                                            documentSnapshot[
                                                            'status']
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .poppins(
                                                                color: Colors
                                                                    .red,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize:
                                                                dimension
                                                                    .font15))),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: dimension.height7,
                                              ),
                                              Text(
                                                documentSnapshot[' serviceName']
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                    color: AppColors.Colorq,
                                                    fontSize: dimension.font15,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: dimension.height7,
                                              ),
                                              Text(
                                                documentSnapshot['totalPrice']
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                    color: AppColors.Colorq,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: dimension.font15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: dimension.height15,
                                          right: dimension.height15,
                                          top: dimension.height15),
                                      child: Container(
                                        height: dimension.height100,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                dimension.height15),
                                            color: AppColors.Colorq.withOpacity(
                                                0.07)),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: dimension.height15,
                                              left: dimension.height15,
                                              right: dimension.height15),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Date & Time',
                                                      style: GoogleFonts.poppins(
                                                          color: AppColors.Colorq,
                                                          fontSize:
                                                          dimension.font13,
                                                          fontWeight:
                                                          FontWeight.w300)),
                                                  SizedBox(
                                                    width: dimension.height47,
                                                  ),
                                                  Text(
                                                      documentSnapshot['date']
                                                          .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize:
                                                          dimension.font13,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color:
                                                          AppColors.Colorq)),
                                                  SizedBox(
                                                    width: dimension.height3,
                                                  ),
                                                  Text("At",
                                                      style: GoogleFonts.poppins(
                                                          fontSize:
                                                          dimension.font13,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color:
                                                          AppColors.Colorq)),
                                                  SizedBox(
                                                    width: dimension.height3,
                                                  ),
                                                  Text(
                                                      documentSnapshot['time']
                                                          .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize:
                                                          dimension.font13,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color:
                                                          AppColors.Colorq)),
                                                ],
                                              ),
                                              Divider(
                                                color: AppColors.Colorq,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text('Provider',
                                                      style: GoogleFonts.poppins(
                                                          color: AppColors.Colorq,
                                                          fontSize:
                                                          dimension.font13,
                                                          fontWeight:
                                                          FontWeight.w300)),
                                                  Text(
                                                      documentSnapshot[
                                                      ' providerName']
                                                          .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize:
                                                          dimension.font13,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color:
                                                          AppColors.Colorq)),
                                                ],
                                              ),
                                              Divider(
                                                color: AppColors.Colorq,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),  onWillPop: () async{
          print("Tapped");
          setState(() {
            Get.off(home_page());
          });
          return false;
        },)
      ),
    );
  }
}
