import 'package:admin_app/bigtext.dart';
import 'package:admin_app/smalltext.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ProviderDetailss extends StatefulWidget {
  String ProviderId;

  ProviderDetailss({Key? key, required this.ProviderId});

  @override
  State<ProviderDetailss> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<ProviderDetailss> {
  callProviderNumber(String phoneNumber) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (!res!) {
    }
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
    DocumentReference documentReference = FirebaseFirestore.instance.collection('providerDetails').doc(widget.ProviderId);

    return documentReference.get();
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
      body: Column(
        children: [
          Text(userDetailsSS?.get("firstName")),

        ],
      ),

    );
  }
}
