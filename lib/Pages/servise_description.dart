import 'dart:convert';

import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:bounce/bounce.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class ServiceDescription extends StatefulWidget {
  String serviceId;

  ServiceDescription({super.key, required this.serviceId});

  @override
  State<ServiceDescription> createState() => _ServiceDescriptionState();
}

DocumentSnapshot? serviceDetailsSS;
DocumentSnapshot? documentSnapshot1;
String bookServiceId = "";
String ServiceProviderId = "";
String serviceImg = "";
String serviceName = "";
String serviceDuration = "";
String providerName = "";
String servicePrice = "";
String providerMoNo = "";
String currentUid = "";
String providerImg = "";



class _ServiceDescriptionState extends State<ServiceDescription> {
  @override
  User? _user;
  List<String> _favoriteItems = [];





  // late final String phoneNumber;

  callProviderNumber(String phoneNumber) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (!res!) {
      // Handle error
    }
  }

  @override
  void initState() {
    super.initState();
    print(widget.serviceId);

    bookServiceId = widget.serviceId;
    fetchServiceData();
    getProviderDetails();

    setState(() {});
    // currentUid = auth.currentUser.uid;
  }

  // for get service details
  Future<void> fetchServiceData() async {
    try {
      DocumentSnapshot snapshot = await getDocument();
      setState(() {
        serviceDetailsSS = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
      // Handle error appropriately
    }
  }

  Future<DocumentSnapshot> getDocument() async {
    DocumentReference documentReference =  FirebaseFirestore.instance.collection('providerServiceDetails').doc(widget.serviceId);
    getProviderDetails();
    return documentReference.get();
  }

  // for get provider details using provider id
  Future<void> getProviderDetails() async {
    try {
      DocumentSnapshot snapshot = await getProvider();
      setState(() {
        documentSnapshot1 = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
      // Handle error appropriately
    }
  }

  Future<DocumentSnapshot> getProvider() async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection('providerDetails').doc(serviceDetailsSS!.get("providerId"));
    return documentReference.get();
  }

  bool like = false;


  // double result = serviceRating / ratingUsers;
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> templateParams = {
      "from_name": "Your Name",
      "to_name": "Recipient's Name",
      "status": "Accepted"
      // Add other dynamic template parameters as needed
    };
    num serviceRating = serviceDetailsSS?.get("serviceRating");
    num ratingUsers = serviceDetailsSS?.get("ratingUsers");
    num res = serviceRating / ratingUsers;
    return Scaffold(
      body: serviceDetailsSS != null
          ? Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenwidth() + dimension.height100 * 0.75,
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: screenwidth(),
                            width: screenwidth(),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      serviceDetailsSS!.get("images")),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: dimension.height35,
                                left: dimension.height10,
                                right: 10),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Bounce(
                                  onTap: () {
                                    Get.back();
                                  },
                                  duration: Duration(milliseconds: 200),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.Colorq.withOpacity(
                                          0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: AppColors.Colorq,
                                          size: dimension.height28,
                                        )),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: dimension.height15),
                          child: Container(
                            height: dimension.height100 * 1.86,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: AppColors.grey.withOpacity(0.7),blurRadius: 7,spreadRadius:1)
                              ],
                              borderRadius: BorderRadius.circular(
                                  dimension.height7),
                              border: Border.all(color: AppColors.Colorq),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    serviceDetailsSS!.get("category"),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black54,
                                        fontSize: dimension.height15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: dimension.height5,
                                  ),
                                  Text(
                                    serviceDetailsSS!.get("serviceName"),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontSize: dimension.height18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: dimension.height4,
                                  ),
                                  Text(
                                    serviceDetailsSS!.get("servicePrice"),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontSize: dimension.height16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: dimension.height4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Duration",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black54,
                                            fontSize: dimension.height16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        serviceDetailsSS!
                                            .get("serviceDuration"),
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.height16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ratings",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: Colors.black54,
                                            fontSize: dimension.height16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.star_outlined,
                                        size: dimension.height16,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        '${res}(${(ratingUsers.round())})',
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.height16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: dimension.height10,
                ),
                Padding(
                  padding:  EdgeInsets.all(dimension.height15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        serviceDetailsSS!.get("serviceDescription"),
                        style: GoogleFonts.poppins(
                            color: Colors.black54,
                            fontSize: dimension.height16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: dimension.height15,
                      ),
                      Text(
                        "About Provider",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: AppColors.Colorq,
                            fontSize: dimension.height18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: dimension.height10,
                      ),
                      Bounce(
                        duration: Duration(milliseconds: 200),
                        onTap: () {
                          getProviderDetails();

                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(dimension.height7),
                            color: AppColors.Colorq.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: dimension.height70,
                                      width: dimension.height70,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  serviceDetailsSS!.get(
                                                      "providerImage")),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle,
                                          color: AppColors.Colorq),
                                    ),
                                    SizedBox(
                                      width: dimension.height15,
                                    ),
                                    Container(
                                      width: dimension.height100 * 1.9,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            serviceDetailsSS!.get(
                                                "providerName") ??
                                                "hello",
                                            // myObject?.property ?? 'Default Value'
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontSize:
                                                dimension.height20,
                                                fontWeight:
                                                FontWeight.w500),
                                          ),
                                          Text(
                                            serviceDetailsSS!.get(
                                                "providerPhoneNumber") ??
                                                "hello",
                                            // myObject?.property ?? 'Default Value'
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontSize:
                                                dimension.height20,
                                                fontWeight:
                                                FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Bounce(
                                      onTap: () {
                                        // phoneNumber = documentSnapshot!.get("providerPhoneNumber");
                                        callProviderNumber(
                                            serviceDetailsSS!.get(
                                                "providerPhoneNumber"));
                                      },
                                      duration:
                                      Duration(milliseconds: 200),
                                      child: Container(
                                        height: dimension.height40,
                                        width: dimension.height40,
                                        decoration: BoxDecoration(
                                            color: AppColors.Colorq
                                                .withOpacity(0.3),
                                            shape: BoxShape.circle),
                                        child: Icon(Icons.call),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: dimension.height30,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      )
          : CircularProgressIndicator(),
    );
  }
}
// Center(
// child: documentSnapshot != null
// ? Text(documentSnapshot!.get("images"))
//     : CircularProgressIndicator(), // Show a loading indicator while fetching data
// ),
