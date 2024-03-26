import 'package:admin_app/bigtext.dart';
import 'package:admin_app/smalltext.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:bounce/bounce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetails extends StatefulWidget {
  String UserId;

  UserDetails({Key? key, required this.UserId});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  callProviderNumber(String phoneNumber) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (!res!) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchServiceData();
  }

  DocumentSnapshot? userDetailsSS;

  Future<void> fetchServiceData() async {
    try {
      DocumentSnapshot snapshot = await getDocument();
      setState(() {
        userDetailsSS = snapshot;
      });
    } catch (e) {
      print('Error retrieving document: $e');
      // Handle error appropriately
    }
  }

  Future<DocumentSnapshot> getDocument() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('userDetails').doc(widget.UserId);

    return documentReference.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: dimension.font20)),
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
      // body: Column(
      //   children: [
      //     Text(userDetailsSS?.get("fname")),
      //     Text(userDetailsSS?.get("lname")),
      //     Text(userDetailsSS?.get("fname")),
      //     Text(userDetailsSS?.get("fname")),
      //     Text(userDetailsSS?.get("fname")),
      //   ],
      // ),
      body: Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: dimension.height30,
            ),
            Center(
              child: Container(
                height: dimension.height100 + 15,
                width: dimension.width60 * 2,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // border: Border.all(
                    //   color: AppColors.themColor,
                    //   width: dimensions.width2,
                    // ),
                    image: DecorationImage(
                        image: NetworkImage(userDetailsSS?.get('uimage')),
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
                borderRadius: BorderRadius.circular(dimension.radius7),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: dimension.height10),
                child: Row(
                  children: [
                    BigText(
                      text: "Name : ",
                      size: dimension.font18,
                      color: AppColors.Colorq,
                    ),
                    SmallText(
                      text: userDetailsSS?.get("fname") +
                          ' ' +
                          userDetailsSS?.get('lname'),
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
                    width: dimension.width50 * 7 + 12,
                    //   width: dimensions.width50*3,
                    decoration: BoxDecoration(
                      color: AppColors.Colorq.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(dimension.radius7),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: dimension.height10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                            text: "Contact No : ",
                            size: dimension.font18,
                            color: AppColors.Colorq,
                          ),
                          SmallText(
                            text: userDetailsSS?.get('mono'),
                            // Assuming 'name' is the field name
                            size: dimension.font16,
                            fontWeight: FontWeight.w500,
                          ),
                          Spacer(),
                          Bounce(
                            duration: Duration(milliseconds: 200),
                            onTap: () {
                              callProviderNumber(userDetailsSS?.get('mono'));
                            },
                            child: Container(
                              height: dimension.height40,
                              width: dimension.height40,
                              decoration: BoxDecoration(
                                  color: AppColors.Colorq
                                      .withOpacity(0.3),
                                  shape: BoxShape.circle),
                              child: Icon(Icons.call,color: AppColors.Colorq,),
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
                padding: EdgeInsets.symmetric(horizontal: dimension.height10),
                child: Row(
                  children: [
                    BigText(
                      text: "Email : ",
                      size: dimension.font18,
                      color: AppColors.Colorq,
                    ),
                    SmallText(
                      text: userDetailsSS?.get('emailid'),
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
          ],
        ),
      ),
    );
  }
}
