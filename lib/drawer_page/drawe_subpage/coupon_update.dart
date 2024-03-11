
import 'package:admin_app/drawer_page/drawe_subpage/coupon_list.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class couponsupdate extends StatefulWidget {
  const couponsupdate({super.key});

  @override
  State<couponsupdate> createState() => _couponsupdateState();
}

class _couponsupdateState extends State<couponsupdate> {
  final _formkey = GlobalKey<FormState>();
  final _dis = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        leading: IconButton(
          onPressed: () {
            Get.to(couponlist());
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: dimension.icon30,
          ),
        ),
        title: Text("Update Coupon",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: dimension.height15),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // body: Padding(
      //   padding: EdgeInsets.only(top: 20, left: 12, right: 12),
      //   child: Column(
      //     children: [
      //       Form(
      //         key: _formkey,
      //         child: TextFormField(
      //           decoration: InputDecoration(
      //               filled: true,
      //               fillColor: AppColors.Colorq.withOpacity(0.05),
      //               border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(15)),
      //               hintText: "FTY5YJ6N",
      //               labelText: "Coupon Code",
      //               labelStyle: TextStyle(color: Colors.black87),
      //               enabledBorder: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(15),
      //                 borderSide: BorderSide(color: Colors.white),
      //               ),
      //               focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: AppColors.Colorq),
      //                   borderRadius: BorderRadius.circular(15))),
      //           validator: (value) {
      //             if (value == null || value.isEmpty) {
      //               return "Enter Coupon code";
      //             } else {
      //               return null;
      //             }
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         height: 15,
      //       ),
      //       Container(
      //         height: 150,
      //         width: double.maxFinite,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Form(
      //               key: _dis,
      //               child: TextFormField(
      //                 decoration: InputDecoration(
      //                     filled: true,
      //                     fillColor: AppColors.Colorq.withOpacity(0.05),
      //                     border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(15)),
      //                     hintText: "3",
      //                     labelText: "Discount",
      //                     labelStyle: TextStyle(color: Colors.black87),
      //                     enabledBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(15),
      //                       borderSide: BorderSide(color: Colors.white),
      //                     ),
      //                     focusedBorder: OutlineInputBorder(
      //                         borderSide: BorderSide(color: AppColors.Colorq),
      //                         borderRadius: BorderRadius.circular(15))),
      //                 validator: (value) {
      //                   if (value == null || value.isEmpty) {
      //                     return "Enter Discount";
      //                   } else {
      //                     return null;
      //                   }
      //                 },
      //               ),
      //             ),
      //             TextFormField(
      //               decoration: InputDecoration(
      //                   filled: true,
      //                   fillColor: AppColors.Colorq.withOpacity(0.05),
      //                   border: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(15)),
      //                   hintText: "3",
      //                   labelText: "Discount",
      //                   labelStyle: TextStyle(color: Colors.black87),
      //                   enabledBorder: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(15),
      //                     borderSide: BorderSide(color: Colors.white),
      //                   ),
      //                   focusedBorder: OutlineInputBorder(
      //                       borderSide: BorderSide(color: AppColors.Colorq),
      //                       borderRadius: BorderRadius.circular(15))),
      //               validator: (value) {
      //                 if (value == null || value.isEmpty) {
      //                   return "Enter Discount";
      //                 } else {
      //                   return null;
      //                 }
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           _formkey.currentState!.validate();
      //         },
      //         child: Container(
      //           height: 60,
      //           width: double.maxFinite,
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(15),
      //               color: AppColors.Colorq),
      //           child: Center(
      //             child: Text(
      //               "Save",
      //               style:
      //                   GoogleFonts.poppins(color: Colors.white, fontSize: 22),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding:  EdgeInsets.all(dimension.height16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: _formkey,
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.Colorq.withOpacity(0.05),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(dimension.radius15)),
                      hintText: "FTY5YJ6N",
                      labelText: "Coupon Code",
                      labelStyle: TextStyle(color: Colors.black87),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(dimension.radius15),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.Colorq),
                          borderRadius: BorderRadius.circular(dimension.radius15))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Coupon code";
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              SizedBox(height: dimension.height10), // Spacer

              // Row with TextField and DropdownButton
              Row(
                children: [
                  Expanded(
                    child: Form(
                      key: _dis,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.Colorq.withOpacity(0.05),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(dimension.radius15)),
                            hintText: "3",
                            labelText: "Discount",
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(dimension.radius15),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.Colorq),
                                borderRadius: BorderRadius.circular(dimension.radius15))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Discount";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: dimension.height10), // Spacer
                  Expanded(
                    child: Container(
                      height: dimension.height60,
                      decoration: BoxDecoration(
                          color: AppColors.Colorq.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(dimension.radius15)),
                      child: Center(
                        child: DropdownButton<String>(
                          items: ['Fixed', 'Percentage'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle dropdown value change
                          },
                          hint: Text('Select an option'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: dimension.height10), // Spacer

              // DatepickerWithIconAndLabel(
              //   labelText: 'Select Date',
              //   hintText: 'Tap to select date',
              //   onDateSelected: (DateTime selectedDate) {
              //     // Handle the selected date
              //     print('Selected date: $selectedDate');
              //   },
              // ),
              Container(
                height: dimension.height60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimension.radius15),
                    color: AppColors.Colorq.withOpacity(0.05)),
              ),
              SizedBox(
                height: dimension.height10,
              ),
              Container(
                height: dimension.height100*3+50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(dimension.radius15),
                    color: AppColors.Colorq.withOpacity(0.05)),
                child: Padding(
                  padding: EdgeInsets.only(left: dimension.height10, top: dimension.height20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selected Service",
                        style: GoogleFonts.poppins(
                            fontSize: dimension.font18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          Container(
                            height: dimension.height100*3,
                            width: dimension.height100*2+20,
                          // color: Colors.green,
                            child: Padding(
                              padding: EdgeInsets.all(dimension.radius15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:  EdgeInsets.only(top: 8.0),
                                          child: SingleChildScrollView(
                                            child: Text(
                                              "-  Filer Replacement",
                                              style: GoogleFonts.poppins(
                                                  fontSize: dimension.font15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: dimension.height100*3,
                            width: 120,
                            //  color: Colors.red,
                            child: Center(
                              child: Text(
                                "Pick a Service",
                                style: GoogleFonts.poppins(
                                    fontSize: dimension.font15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.Colorq),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: AppColors.Colorq.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:  EdgeInsets.only(left: 10,top: 5),
                  child: DropdownButton<String>(
                    items: ['Active', 'Inactive'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value change
                    },
                    hint: Text('Select Status'),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  _formkey.currentState!.validate();
                  _dis.currentState!.validate();
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
            ],
          ),
        ),
      ),
    );
  }
}
