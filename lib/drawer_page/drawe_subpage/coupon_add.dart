
import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class couponadd extends StatefulWidget {
  const couponadd({super.key});

  @override
  State<couponadd> createState() => _couponaddState();
}

class _couponaddState extends State<couponadd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text("Coupons",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),

      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(

                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.Colorq.withOpacity(0.05),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "FTY5YJ6N",
                      labelText: "Coupon Code",
                      labelStyle: TextStyle(color: Colors.black87),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.Colorq),
                          borderRadius: BorderRadius.circular(15))),

                ),
              ),

              SizedBox(height: 10), // Spacer

              // Row with TextField and DropdownButton
              Row(
                children: [
                  Expanded(
                    child: Form(

                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.Colorq.withOpacity(0.05),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "3",
                            labelText: "Discount",
                            labelStyle: TextStyle(color: Colors.black87),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.Colorq),
                                borderRadius: BorderRadius.circular(15))),

                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Spacer
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColors.Colorq.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15)),
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
              SizedBox(height: 10), // Spacer

              // DatepickerWithIconAndLabel(
              //   labelText: 'Select Date',
              //   hintText: 'Tap to select date',
              //   onDateSelected: (DateTime selectedDate) {
              //     // Handle the selected date
              //     print('Selected date: $selectedDate');
              //   },
              // ),
              Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.Colorq.withOpacity(0.05)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 90,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.Colorq.withOpacity(0.05)),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Padding(
                        padding:  EdgeInsets.only(left: 10,top: 20),
                        child: Text(
                          "Pick a Service",
                          style: GoogleFonts.poppins(
                              fontSize: dimension.font15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.Colorq),
                        ),
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
                height: 30,
              ),
              GestureDetector(
                onTap: () {

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
