import 'package:admin_app/Booking_Show.dart';
import 'package:admin_app/login.dart';
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
import 'package:bounce/bounce.dart';
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
int bookingCountt = 0;
int servicesCountt = 0;
int providerCountt = 0;
int userCountt = 0;
  List providernamee = ['Jorge Perez', 'Daniel Wiliams', 'jennifer Davis'];
  final CollectionReference refpro =
      FirebaseFirestore.instance.collection('providerDetails');
  Future<int> bookingCount() async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('bookingg');

    QuerySnapshot querySnapshot = await collectionReference.get();
    bookingCountt = querySnapshot.size;
    setState(() {

    });
    return querySnapshot.size;
  }
  Future<int> serviceCount() async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('providerServiceDetails');

    QuerySnapshot querySnapshot = await collectionReference.get();
    servicesCountt = querySnapshot.size;
    setState(() {

    });
    return querySnapshot.size;
  }
  Future<int> providerCount() async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('providerDetails');

    QuerySnapshot querySnapshot = await collectionReference.get();
    providerCountt = querySnapshot.size;
    setState(() {

    });
    return querySnapshot.size;
  }
  Future<int> userCount() async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('userDetails');

    QuerySnapshot querySnapshot = await collectionReference.get();
    userCountt = querySnapshot.size;
    setState(() {

    });
    return querySnapshot.size;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookingCount();
    serviceCount();
    providerCount();userCount();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            iconTheme:
                IconThemeData(color: Colors.white, size: dimension.icon30),
            backgroundColor: AppColors.Colorq,

            title: Text("Admin",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: dimension.font20)),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: dimension.height100 * 3.1,
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
                              fontWeight: FontWeight.w500,
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
                                              bookingCountt.toString(),
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
                                              servicesCountt.toString(),
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
                                              providerCountt.toString(),
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
                                              userCountt.toString(),
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
                                          "Total Users",
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
                  // color: AppColors.Colorq.withOpacity(0.05),
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
                                  fontSize: dimension.font20),
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
                            fontSize: dimension.font20),
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
                  height: dimension.height19,
                ),
                Bookingshow(),

                SizedBox(
                  height: dimension.height15,
                ),
                Container(
                  height: dimension.height100 * 3,
                 // color: AppColors.Colorq.withOpacity(0.05),
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
                                  fontSize: dimension.font20),
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
                              color: AppColors.Colorq,
                              fontWeight: FontWeight.w500,
                              fontSize: dimension.font18))),
                ],
              ),
            ),
          ),

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
                      child: Text("Category List",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontWeight: FontWeight.w500,
                              fontSize: dimension.font18))),
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
                              color: AppColors.Colorq,
                              fontWeight: FontWeight.w500,
                              fontSize: dimension.font18))),
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
                              color: AppColors.Colorq,
                              fontWeight: FontWeight.w500,
                              fontSize: dimension.font18))),
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
                              color: AppColors.Colorq,
                              fontWeight: FontWeight.w500,
                              fontSize: dimension.font18))),
                ],
              ),
            ),
          ),
          Bounce(
            duration: Duration(milliseconds: 200),
            onTap: () {
              Get.defaultDialog(
                // ScaffoldKey.currentState?.openEndDrawer();
                buttonColor: AppColors.Colorq,
                backgroundColor: Colors.white,
                cancelTextColor: AppColors.Colorq,
                titleStyle: GoogleFonts.poppins(
                    fontSize: 28, color: AppColors.Colorq),
                titlePadding: EdgeInsets.all(10),
                title: "Log Out",
                // contentPadding: EdgeInsets.all(),
                // middleText: "Are you sure to delete",
                content: Column(
                  children: [
                    Text(
                      "Are you sure you want to Log out?",
                      style: GoogleFonts.poppins(
                          color: AppColors.Colorq,
                          fontSize: dimension.height17,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                textConfirm: "Yes",
                textCancel: "Noo",
                confirm: TextButton(
                  onPressed: () async {
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
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: AppColors.Colorq,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        // color: AppColors.orange,
                          border: Border.all(
                              color: AppColors.Colorq, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "No",
                          style: GoogleFonts.poppins(
                              color: AppColors.Colorq,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
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
                              color: AppColors.Colorq,
                              fontWeight: FontWeight.w500,
                              fontSize: dimension.font18))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
