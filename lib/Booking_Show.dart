import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookingshow extends StatefulWidget {
  const Bookingshow({super.key});

  @override
  State<Bookingshow> createState() => _BookingshowState();
}

class _BookingshowState extends State<Bookingshow> {
  List providerimg = [
    'assets/images/provider1.jpg',
    'assets/images/provider3.jpg',
    'assets/i,mages/provider4.jpg',
  ];
  List providername = [
    'Katie Brown',
    'Fabian RAMOS NUNO',
    'Taxi Bouffe',
  ];
  List helper = [
    'assets/images/helper1.jpg',
    'assets/images/helper2.jpg',
    'assets/images/helper3.jpg'
  ];
  List jobre = ['Test', 'Flutter', 'Good', 'Flutter App', 'Flutter Firebase'];
  List jobru = ['2200', '2800', '5000', '3700', '1800'];
  List jobdate = [
    '1/3/2024 09:26 AM',
    '1/3/2024 09:26 AM',
    '1/3/2024 09:26 AM',
    '1/3/2024 09:26 AM',
    '1/3/2024 09:26 AM'
  ];
  List bookingname = [
    'Ceiling and Wall Cleaning',
    'Custom Frame Painting',
    'Ac installation'
  ];
  List bookingprice = ['1300', '1800', '3500'];
  List bookingnum = ['#270', '#269', '#268'];
  List timedate = [
    '3 jan, 2024 At 12:00 Am',
    '6 jan, 2024 At 03:00 Pm',
    '4 jan, 2024 At 02:25 Pm'
  ];

  List providernamee = ['Jorge Perez', 'Daniel Wiliams', 'jennifer Davis'];

  final CollectionReference refpro =
      FirebaseFirestore.instance.collection('bookingg');

  // final CollectionReference refpro =
  //     FirebaseFirestore.instance.collection('userDetails');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: refpro.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return Container(
            height: dimension.height100 * 8,
            //   color: Colors.deepPurpleAccent,
            child: ListView.builder(
              itemCount: 3,
              //  scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Padding(
                  padding: EdgeInsets.only(
                      left: dimension.height12, right: dimension.height12),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: dimension.height20),
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
                                  borderRadius:
                                      BorderRadius.circular(dimension.height15),
                                  //color: Colors.green,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          documentSnapshot[' serviceImg']
                                              .toString()),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: dimension.height15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: dimension.height35,
                                          width: dimension.height95,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      dimension.height10),
                                              color: Colors.red.shade100),
                                          child: Center(
                                              child: Text(
                                                  documentSnapshot['status']
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          dimension.font15))),
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
                                      documentSnapshot['totalPrice'].toString(),
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
                                  borderRadius:
                                      BorderRadius.circular(dimension.height15),
                                  color: AppColors.Colorq.withOpacity(0.07)),
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
                                                fontSize: dimension.font13,
                                                fontWeight: FontWeight.w300)),
                                        SizedBox(
                                          width: dimension.height50,
                                        ),
                                        Text(
                                            documentSnapshot['date'].toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: dimension.font13,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.Colorq)),
                                        SizedBox(
                                          width: dimension.height3,
                                        ),
                                        Text("At",
                                            style: GoogleFonts.poppins(
                                                fontSize: dimension.font13,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.Colorq)),
                                        SizedBox(
                                          width: dimension.height3,
                                        ),
                                        Text(
                                            documentSnapshot['time'].toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: dimension.font13,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.Colorq)),
                                      ],
                                    ),
                                    Divider(
                                      color: AppColors.Colorq,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Provider',
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontSize: dimension.font13,
                                                fontWeight: FontWeight.w300)),
                                        Text(
                                            documentSnapshot[' providerName']
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: dimension.font13,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.Colorq)),
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
    );
  }
}
