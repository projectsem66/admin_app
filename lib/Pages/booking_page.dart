
import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';


class bookingpage extends StatefulWidget {
  const bookingpage({super.key});

  @override
  State<bookingpage> createState() => _bookingpageState();
}

class _bookingpageState extends State<bookingpage> {
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
  List helper = [
    'assets/images/helper1.jpg',
    'assets/images/helper2.jpg',
    'assets/images/helper3.jpg'
  ];
  List providernamee = ['Jorge Perez', 'Daniel Wiliams', 'jennifer Davis'];

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
        title: Text("Bookings",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: dimension.font20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: dimension.height15),
              height: dimension.height100 * 8 + 30,
              //   color: Colors.deepPurpleAccent,
              child: ListView.builder(
                itemCount: 3,
                //  scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: dimension.height12, right: dimension.height12),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: dimension.height20),
                      child: Container(
                        height: dimension.height100 * 2 + 60,
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
                                      borderRadius: BorderRadius.circular(
                                          dimension.height15),
                                      //color: Colors.green,
                                      image: DecorationImage(
                                          image: AssetImage(helper[index]),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: dimension.height15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: dimension.height32,
                                            width: dimension.height82,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        dimension.height10),
                                                color: Colors.red.shade100),
                                            child: Center(
                                                child: Text("Pending",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            dimension.font15))),
                                          ),
                                          SizedBox(
                                            width: dimension.height85,
                                          ),
                                          Text(
                                            bookingnum[index],
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontWeight: FontWeight.bold,
                                                fontSize: dimension.font15),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: dimension.height7,
                                      ),
                                      Text(
                                        bookingname[index],
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.font15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: dimension.height7,
                                      ),
                                      Text(
                                        bookingprice[index],
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
                                height: dimension.height100 + 10,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        dimension.height15),
                                    color: AppColors.Colorq.withOpacity(0.07)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: dimension.height15,
                                      left: dimension.height15,
                                      right: dimension.height15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Date & Time',
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontSize: dimension.font13,
                                                  fontWeight: FontWeight.w300)),
                                          Text(timedate[index],
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
                                          Text(providernamee[index],
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
                                          Text('Customer Name',
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontSize: dimension.font13,
                                                  fontWeight: FontWeight.w300)),
                                          Text(
                                            'Pedro Norris',
                                            style: GoogleFonts.poppins(
                                                fontSize: dimension.font13,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.Colorq),
                                          ),
                                        ],
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
            ),
          ],
        ),
      ),
    );
  }
}
