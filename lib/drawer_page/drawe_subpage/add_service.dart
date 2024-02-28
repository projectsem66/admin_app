import 'dart:math';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class addservice extends StatefulWidget {
  const addservice({super.key});

  @override
  State<addservice> createState() => _addserviceState();
}

class _addserviceState extends State<addservice> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: dimension.height12,
            right: dimension.height12,
            top: dimension.height45),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(
                  //     color: AppColors.Colorq, style: BorderStyle.solid)
                ),
                child: DottedBorder(
                  color: AppColors.Colorq,
                  radius: Radius.circular(15),
                  borderType: BorderType.Rect,
                  strokeWidth: 1,
                  child: Center(
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: IconButton(
                              iconSize: 100,
                              icon: Icon(Icons.add_a_photo_outlined),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Text(
                              "Choose image",
                              style: GoogleFonts.poppins(
                                  color: AppColors.Colorq,
                                  fontWeight: FontWeight.w300,
                                  fontSize: dimension.font15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7),
              Text(
                "Note : you can upload images with 'jpg', 'png', 'jpeg' extension",
                style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: dimension.font10),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 700,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.Colorq.withOpacity(0.1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Column(
                    children: [
                      Form(
                        key: _formkey,
                        child: TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                              filled: true,
                              hintText: "Service Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: AppColors.Colorq))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Service Name';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Services is added "),
                        backgroundColor: AppColors.Colorq.withOpacity(0.5),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 60,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.Colorq),
                  child: Center(
                    child: Text(
                      "Save",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
