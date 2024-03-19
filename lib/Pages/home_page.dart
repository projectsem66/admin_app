import 'package:admin_app/Booking_Show.dart';
import 'package:admin_app/FAVRATE.dart';
import 'package:admin_app/Pages/all_service.dart';
import 'package:admin_app/Pages/booking_page.dart';
import 'package:admin_app/Total_Booking_List.dart';
import 'package:admin_app/drawer_page/drawe_subpage/category_list.dart';
import 'package:admin_app/my_drawer_header.dart';
import 'package:admin_app/simple.dart';
import 'package:admin_app/subcetegory.dart';
import 'package:admin_app/total_provider.dart';
import 'package:admin_app/total_provider_list.dart';
import 'package:admin_app/total_user.dart';
import 'package:admin_app/total_user_list.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:admin_app/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer_page/drawer.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _home_pageState extends State<home_page> {
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
      FirebaseFirestore.instance.collection('providerDetails');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            iconTheme:
                IconThemeData(color: Colors.white, size: dimension.icon30),
            backgroundColor: AppColors.Colorq,
            // leading: IconButton(
            //   onPressed: () {
            //     Get.to(drawer());
            //   },
            //   icon: Icon(
            //     Icons.menu,
            //     color: Colors.white,
            //     size:dimension.icon30,
            //   ),
            // ),
            title: Text("Dashboard",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: dimension.font20)),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: dimension.height100 * 3,
                  width: double.maxFinite,
                  // color: Colors.orangeAccent.shade100,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: dimension.height12,
                        right: dimension.height12,
                        top: dimension.height15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Admin",
                          style: GoogleFonts.poppins(
                              fontSize: dimension.font22,
                              fontWeight: FontWeight.w600,
                              color: AppColors.Colorq),
                        ),
                        SizedBox(),
                        Text(
                          "Welcome back!",
                          style: GoogleFonts.poppins(
                              fontSize: dimension.font15,
                              fontWeight: FontWeight.w400,
                              color: AppColors.Colorq),
                        ),
                        SizedBox(
                          height: dimension.height15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(Total_booking_List());
                                },
                                child: Container(
                                  height: dimension.height100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          dimension.height10),
                                      border:
                                          Border.all(color: AppColors.Colorq)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: dimension.height15,
                                        right: dimension.height15,
                                        top: dimension.height15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "96",
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: dimension.font25),
                                            ),
                                            Container(
                                              height: dimension.height30,
                                              width: dimension.height30,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white10),
                                              child: Icon(
                                                Icons.list_alt,
                                                color: AppColors.Colorq,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: dimension.height8,
                                        ),
                                        Text(
                                          "Total Bookings",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontWeight: FontWeight.w300,
                                              fontSize: dimension.font15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: dimension.height10,
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(allservice());
                                },
                                child: Container(
                                  height: dimension.height100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          dimension.height10),
                                      border:
                                          Border.all(color: AppColors.Colorq)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: dimension.height15,
                                        right: dimension.height15,
                                        top: dimension.height15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "35",
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: dimension.font25),
                                            ),
                                            Container(
                                              height: dimension.height30,
                                              width: dimension.height30,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white10),
                                              child: Icon(
                                                Icons
                                                    .miscellaneous_services_outlined,
                                                color: AppColors.Colorq,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: dimension.height8,
                                        ),
                                        Text(
                                          "Total Services",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontWeight: FontWeight.w300,
                                              fontSize: dimension.font15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: dimension.height10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Get.to(providerList());
                                },
                                child: Container(
                                  height: dimension.height100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          dimension.height10),
                                      border:
                                          Border.all(color: AppColors.Colorq)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: dimension.height15,
                                        right: dimension.height15,
                                        top: dimension.height15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "13",
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: dimension.font25),
                                            ),
                                            Container(
                                              height: dimension.height30,
                                              width: dimension.height30,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white10),
                                              child: Icon(
                                                Icons.person,
                                                color: AppColors.Colorq,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: dimension.height8,
                                        ),
                                        Text(
                                          "Total Providers",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontWeight: FontWeight.w300,
                                              fontSize: dimension.font15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: dimension.height10,
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Get.to(Total_User_List());
                                },
                                child: Container(
                                  height: dimension.height100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          dimension.height10),
                                      border:
                                          Border.all(color: AppColors.Colorq)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: dimension.height15,
                                        right: dimension.height15,
                                        top: dimension.height15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "31",
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: dimension.font25),
                                            ),
                                            Container(
                                              height: dimension.height30,
                                              width: dimension.height30,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white10),
                                              child: Icon(
                                                Icons.person,
                                                color: AppColors.Colorq,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: dimension.height8,
                                        ),
                                        Text(
                                          "Total Useres",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontWeight: FontWeight.w300,
                                              fontSize: dimension.font15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height15,
                ),
                Container(
                  height: dimension.height100 * 3,
                  color: AppColors.Colorq.withOpacity(0.07),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: dimension.height15,
                        right: dimension.height15,
                        top: dimension.height20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Provider",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontWeight: FontWeight.w400,
                                  fontSize: dimension.font22),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(providerList());
                              },
                              child: Text(
                                "View all",
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq.withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                    fontSize: dimension.font18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: dimension.height10,
                        ),
                        totalprovider()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height18,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: dimension.height12, right: dimension.height12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Booking",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontWeight: FontWeight.w400,
                            fontSize: dimension.font22),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(Total_booking_List());
                        },
                        child: Text(
                          "View all",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                              fontSize: dimension.font18),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: dimension.height18,
                ),
                Bookingshow(),
                // Container(
                //   height: dimension.height100 * 8 + 30,
                //   //   color: Colors.deepPurpleAccent,
                //   child: ListView.builder(
                //     itemCount: 3,
                //     //  scrollDirection: Axis.vertical,
                //     // shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.only(
                //             left: dimension.height12,
                //             right: dimension.height12),
                //         child: Padding(
                //           padding: EdgeInsets.only(bottom: dimension.height20),
                //           child: Container(
                //             height: dimension.height100 * 2 + 60,
                //             width: double.maxFinite,
                //             decoration: BoxDecoration(
                //                 borderRadius:
                //                     BorderRadius.circular(dimension.height15),
                //                 border: Border.all(color: AppColors.Colorq)),
                //             child: Column(
                //               children: [
                //                 Row(
                //                   children: [
                //                     Container(
                //                       margin: EdgeInsets.only(
                //                           top: dimension.height18,
                //                           left: dimension.height15),
                //                       height: dimension.height100,
                //                       width: dimension.height100,
                //                       decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(
                //                               dimension.height15),
                //                           //color: Colors.green,
                //                           image: DecorationImage(
                //                               image: AssetImage(helper[index]),
                //                               fit: BoxFit.cover)),
                //                     ),
                //                     Padding(
                //                       padding: EdgeInsets.only(
                //                           left: dimension.height15),
                //                       child: Column(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.start,
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           Row(
                //                             children: [
                //                               Container(
                //                                 height: dimension.height32,
                //                                 width: dimension.height82,
                //                                 decoration: BoxDecoration(
                //                                     borderRadius:
                //                                         BorderRadius.circular(
                //                                             dimension.height10),
                //                                     color: Colors.red.shade100),
                //                                 child: Center(
                //                                     child: Text("Pending",
                //                                         style: GoogleFonts.poppins(
                //                                             color: Colors.red,
                //                                             fontWeight:
                //                                                 FontWeight.bold,
                //                                             fontSize: dimension
                //                                                 .font15))),
                //                               ),
                //                               SizedBox(
                //                                 width: dimension.height85,
                //                               ),
                //                               Text(
                //                                 bookingnum[index],
                //                                 style: GoogleFonts.poppins(
                //                                     color: AppColors.Colorq,
                //                                     fontWeight: FontWeight.bold,
                //                                     fontSize: dimension.font15),
                //                               ),
                //                             ],
                //                           ),
                //                           SizedBox(
                //                             height: dimension.height7,
                //                           ),
                //                           Text(
                //                             bookingname[index],
                //                             style: GoogleFonts.poppins(
                //                                 color: AppColors.Colorq,
                //                                 fontSize: dimension.font15,
                //                                 fontWeight: FontWeight.w500),
                //                           ),
                //                           SizedBox(
                //                             height: dimension.height7,
                //                           ),
                //                           Text(
                //                             bookingprice[index],
                //                             style: GoogleFonts.poppins(
                //                                 color: AppColors.Colorq,
                //                                 fontWeight: FontWeight.w600,
                //                                 fontSize: dimension.font15),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(
                //                       left: dimension.height15,
                //                       right: dimension.height15,
                //                       top: dimension.height15),
                //                   child: Container(
                //                     height: dimension.height100 + 10,
                //                     width: double.maxFinite,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(
                //                             dimension.height15),
                //                         color:
                //                             AppColors.Colorq.withOpacity(0.07)),
                //                     child: Padding(
                //                       padding: EdgeInsets.only(
                //                           top: dimension.height15,
                //                           left: dimension.height15,
                //                           right: dimension.height15),
                //                       child: Column(
                //                         children: [
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               Text('Date & Time',
                //                                   style: GoogleFonts.poppins(
                //                                       color: AppColors.Colorq,
                //                                       fontSize:
                //                                           dimension.font13,
                //                                       fontWeight:
                //                                           FontWeight.w300)),
                //                               Text(timedate[index],
                //                                   style: GoogleFonts.poppins(
                //                                       fontSize:
                //                                           dimension.font13,
                //                                       fontWeight:
                //                                           FontWeight.w500,
                //                                       color: AppColors.Colorq)),
                //                             ],
                //                           ),
                //                           Divider(
                //                             color: AppColors.Colorq,
                //                           ),
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               Text('Provider',
                //                                   style: GoogleFonts.poppins(
                //                                       color: AppColors.Colorq,
                //                                       fontSize:
                //                                           dimension.font13,
                //                                       fontWeight:
                //                                           FontWeight.w300)),
                //                               Text(providernamee[index],
                //                                   style: GoogleFonts.poppins(
                //                                       fontSize:
                //                                           dimension.font13,
                //                                       fontWeight:
                //                                           FontWeight.w500,
                //                                       color: AppColors.Colorq)),
                //                             ],
                //                           ),
                //                           Divider(
                //                             color: AppColors.Colorq,
                //                           ),
                //                           Row(
                //                             mainAxisAlignment:
                //                                 MainAxisAlignment.spaceBetween,
                //                             children: [
                //                               Text('Customer Name',
                //                                   style: GoogleFonts.poppins(
                //                                       color: AppColors.Colorq,
                //                                       fontSize:
                //                                           dimension.font13,
                //                                       fontWeight:
                //                                           FontWeight.w300)),
                //                               Text(
                //                                 'Pedro Norris',
                //                                 style: GoogleFonts.poppins(
                //                                     fontSize: dimension.font13,
                //                                     fontWeight: FontWeight.w500,
                //                                     color: AppColors.Colorq),
                //                               ),
                //                             ],
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),

                SizedBox(
                  height: dimension.height15,
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       left: dimension.height12, right: dimension.height12),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Job Request List",
                //         style: GoogleFonts.poppins(
                //             color: AppColors.Colorq,
                //             fontWeight: FontWeight.w400,
                //             fontSize: dimension.font22),
                //       ),
                //       Text(
                //         "View all",
                //         style: GoogleFonts.poppins(
                //             color: AppColors.Colorq.withOpacity(0.8),
                //             fontWeight: FontWeight.w400,
                //             fontSize: dimension.font18),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: dimension.height15,
                // ),
                // ListView.builder(
                //   // scrollDirection: Axis.vertical,
                //   itemCount: 3,
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemBuilder: (context, index) {
                //     return Padding(
                //       padding: EdgeInsets.only(
                //           left: dimension.height12,
                //           right: dimension.height12,
                //           bottom: dimension.height8),
                //       child: Container(
                //         height: dimension.height100,
                //         width: double.maxFinite,
                //         decoration: BoxDecoration(
                //             color: AppColors.Colorq.withOpacity(0.07),
                //             borderRadius:
                //                 BorderRadius.circular(dimension.height12)),
                //         child: Column(
                //           children: [
                //             Row(
                //               children: [
                //                 Container(
                //                   margin: EdgeInsets.only(
                //                       top: dimension.height18,
                //                       left: dimension.height15),
                //                   height: dimension.height70,
                //                   width: dimension.height70,
                //                   decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(
                //                           dimension.height15),
                //                       //color: Colors.green,
                //                       image: DecorationImage(
                //                           image: AssetImage(helper[index]),
                //                           fit: BoxFit.cover)),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(
                //                       left: dimension.height12,
                //                       top: dimension.height10),
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Text(jobre[index],
                //                           style: GoogleFonts.poppins(
                //                               color: AppColors.Colorq,
                //                               fontSize: dimension.font15,
                //                               fontWeight: FontWeight.bold)),
                //                       SizedBox(
                //                         height: dimension.height7,
                //                       ),
                //                       Text(jobru[index],
                //                           style: GoogleFonts.poppins(
                //                               color: AppColors.Colorq,
                //                               fontWeight: FontWeight.w400,
                //                               fontSize: dimension.font12)),
                //                       SizedBox(
                //                         height: dimension.height7,
                //                       ),
                //                       Text(jobdate[index],
                //                           style: GoogleFonts.poppins(
                //                               color: AppColors.Colorq,
                //                               fontWeight: FontWeight.w400,
                //                               fontSize: dimension.font12)),
                //                     ],
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsets.only(
                //                       left: dimension.height46,
                //                       bottom: dimension.height20),
                //                   child: Container(
                //                     margin:
                //                         EdgeInsets.only(right: dimension.height7),
                //                     height: dimension.height35,
                //                     width: dimension.height87,
                //                     decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(
                //                             dimension.height10),
                //                         color: Colors.green.shade100),
                //                     child: Center(
                //                         child: Text("Assigned",
                //                             style: GoogleFonts.poppins(
                //                                 color: Colors.green,
                //                                 fontWeight: FontWeight.bold,
                //                                 fontSize: dimension.font15))),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),
                SizedBox(
                  height: dimension.height15,
                ),
                Container(
                  height: dimension.height100 * 3,
                  color: AppColors.Colorq.withOpacity(0.07),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: dimension.height15,
                        right: dimension.height15,
                        top: dimension.height20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New User",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontWeight: FontWeight.w400,
                                  fontSize: dimension.font22),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(Total_User_List());
                              },
                              child: Text(
                                "View all",
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq.withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                    fontSize: dimension.font18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: dimension.height10,
                        ),
                        Total_user()
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dimension.height20,
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    MyHederDrawer(),
                    MyDrawerList(),
                  ],
                ),
              ),
            ),
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

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [menuItem()],
      ),
    );
  }

  Widget menuItem() {
    return Material(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(simple());
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                    Icons.category,
                    color: AppColors.Colorq,
                  )),
                  Expanded(
                      flex: 3,
                      child: Text("Add Category",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: dimension.font16))),
                ],
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Get.to(sub_category());
          //   },
          //   child: Padding(
          //     padding: EdgeInsets.all(15),
          //     child: Row(
          //       children: [
          //         Expanded(
          //             child: Icon(
          //           Icons.design_services_rounded,
          //           color: AppColors.Colorq,
          //         )),
          //         Expanded(
          //             flex: 3,
          //             child: Text("Add SubCategory",
          //                 style: GoogleFonts.poppins(
          //                     color: AppColors.Colorq.withOpacity(0.7),
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: dimension.font16))),
          //       ],
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Get.to(categorylist());
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                    Icons.list_alt,
                    color: AppColors.Colorq,
                  )),
                  Expanded(
                      flex: 3,
                      child: Text("Categor List",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: dimension.font16))),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(providerList());
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                    Icons.person,
                    color: AppColors.Colorq,
                  )),
                  Expanded(
                      flex: 3,
                      child: Text("Provider List",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: dimension.font16))),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(Total_User_List());
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                    Icons.supervised_user_circle_sharp,
                    color: AppColors.Colorq,
                  )),
                  Expanded(
                      flex: 3,
                      child: Text("User List",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: dimension.font16))),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(Total_booking_List());
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                    Icons.book_outlined,
                    color: AppColors.Colorq,
                  )),
                  Expanded(
                      flex: 3,
                      child: Text("Bookings List",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: dimension.font16))),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text(
                      "Confirm Logout",
                      style: GoogleFonts.poppins(
                          color: AppColors.Colorq,
                          fontWeight: FontWeight.w700,
                          fontSize: dimension.font22),
                    ),
                    content: Text("Are you sure you want to logout?",
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontWeight: FontWeight.bold,
                            fontSize: dimension.font15),
                        overflow: TextOverflow.fade),
                    actions: [
                      // TextButton(
                      //     onPressed: () {
                      //       Navigator.of(context).pop();
                      //     },
                      //     child: Text("No")),
                      // TextButton(
                      //     onPressed: () {
                      //       _auth.signOut().then((value) {
                      //         Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => LoginPage()),
                      //         );
                      //       }).onError((error, stackTrace) {
                      //         Utils().tostmessage(error.toString());
                      //       });
                      //     },
                      //     child: Text("Yes"))
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: dimension.height40,
                          width: dimension.height95,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq,
                              borderRadius:
                                  BorderRadius.circular(dimension.radius15)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cancel_outlined),
                              SizedBox(
                                width: dimension.height7,
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
                      SizedBox(
                        width: dimension.height20,
                      ),
                      InkWell(
                        onTap: () {
                          _auth.signOut().then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          }).onError((error, stackTrace) {
                            Utils().tostmessage(error.toString());
                          });
                        },
                        child: Container(
                          height: dimension.height40,
                          width: dimension.height95,
                          decoration: BoxDecoration(
                              color: AppColors.Colorq,
                              borderRadius:
                                  BorderRadius.circular(dimension.radius15)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.done),
                              SizedBox(
                                width: dimension.height7,
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
                    ],
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Icon(
                    Icons.login_outlined,
                    color: AppColors.Colorq,
                  )),
                  Expanded(
                      flex: 3,
                      child: Text("Logout",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: dimension.font16))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
