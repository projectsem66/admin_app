import 'package:admin_app/bigtext.dart';
import 'package:admin_app/smalltext.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class UserDetails extends StatefulWidget {
  String UserId;

  UserDetails({Key? key, required this.UserId});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  callProviderNumber(String phoneNumber) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (!res!) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'User Details',
          size: dimension.font22,
          color: Colors.white,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.Colorq,
        automaticallyImplyLeading: false,
        //  centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("userDetails").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    color: AppColors.Colorq, strokeCap: StrokeCap.round));
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: snapshot.data!.docs.map((doc) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: dimension.width20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: dimension.height30,
                        ),
                        Center(
                          child: Container(
                            height: dimension.height100 + 20,
                            width: dimension.width60 * 2,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // border: Border.all(
                                //   color: AppColors.themColor,
                                //   width: dimensions.width2,
                                // ),
                                image: DecorationImage(
                                    image: NetworkImage(doc['uimage']),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          height: dimension.height20,
                        ),
                        Container(
                          height: dimension.height50,
                          decoration: BoxDecoration(
                            color: AppColors.Colorq.withOpacity(0.05),
                            borderRadius:
                                BorderRadius.circular(dimension.radius7),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: dimension.height10),
                            child: Row(
                              children: [
                                BigText(
                                  text: "Name : ",
                                  size: dimension.font18,
                                  color: AppColors.Colorq,
                                ),
                                SmallText(
                                  text: doc['fname'] + ' ' + doc['lname'],
                                  // Assuming 'name' is the field name
                                  size: dimension.font16,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: dimension.height10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(children: [
                              Container(
                                height: dimension.height50,
                                width: dimension.width50 * 7,
                                //   width: dimensions.width50*3,
                                decoration: BoxDecoration(
                                  color: AppColors.Colorq.withOpacity(0.05),
                                  borderRadius:
                                      BorderRadius.circular(dimension.radius7),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: dimension.height10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: "Contact No : ",
                                        size: dimension.font18,
                                        color: AppColors.Colorq,
                                      ),
                                      SmallText(
                                        text: doc['mono'],
                                        // Assuming 'name' is the field name
                                        size: dimension.font16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Bounce(
                                        duration: Duration(milliseconds: 200),
                                        onTap: () {
                                          callProviderNumber(doc['mono']);
                                        },
                                        child: Container(
                                          height: dimension.height40,
                                          width: dimension.width40,
                                          decoration: BoxDecoration(
                                            color: AppColors.Colorq.withOpacity(
                                                0.4),
                                            //borderRadius: BorderRadius.circular(dimensions.radius7),
                                            shape: BoxShape.circle,
                                            // border: Border.all( color: AppColors.themColor,width: 2),
                                          ),
                                          child: Icon(Icons.call,
                                              color: AppColors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                            // SizedBox(
                            //   width: dimensions.width10,
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: dimension.height10,
                        ),
                        Container(
                          height: dimension.height50,
                          decoration: BoxDecoration(
                            color: AppColors.Colorq.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: dimension.height10),
                            child: Row(
                              children: [
                                BigText(
                                  text: "Email : ",
                                  size: dimension.font18,
                                  color: AppColors.Colorq,
                                ),
                                SmallText(
                                  text: doc['emailid'],
                                  // Assuming 'name' is the field name
                                  size: dimension.font16,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: dimension.height10,
                        ),
                        Container(
                          width: dimension.width100 * 4,
                          height: dimension.height100,
                          decoration: BoxDecoration(
                            color: AppColors.Colorq.withOpacity(0.05),
                            borderRadius:
                                BorderRadius.circular(dimension.radius7),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: dimension.height10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text: "Address : ",
                                  size: dimension.font18,
                                  color: AppColors.Colorq,
                                ),
                                SizedBox(
                                  height: dimension.height5,
                                ),
                                SizedBox(
                                  height: dimension.height5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}