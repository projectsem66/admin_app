import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/drawer_page/drawe_subpage/coupon_add.dart';
import 'package:admin_app/drawer_page/drawe_subpage/coupon_update.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';


class couponlist extends StatefulWidget {
  const couponlist({super.key});

  @override
  State<couponlist> createState() => _couponlistState();
}

class _couponlistState extends State<couponlist> {
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
              size: dimension.radius15,
            ),
          ),
          title: Text("Coupons",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: dimension.font20)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: dimension.height15),
              child: GestureDetector(
                onTap: () {
                  Get.to(couponadd());
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(couponsupdate());
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: dimension.height12,
                          right: dimension.height12,
                          top: dimension.height15),
                      height: dimension.height100 * 2 + 30,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        //   color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(dimension.radius15),
                        color: AppColors.Colorq.withOpacity(0.09),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: dimension.height22,
                            left: dimension.height15,
                            right: dimension.height15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.person,
                                    color: AppColors.Colorq,
                                  ),
                                ),
                                SizedBox(
                                  width: dimension.height10,
                                ),
                                Container(
                                  //  color: Colors.deepPurple,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Coupon Code",
                                        style: GoogleFonts.poppins(
                                            fontSize: dimension.font15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.Colorq.withOpacity(
                                                0.5)),
                                      ),
                                      SizedBox(
                                        height: dimension.height2,
                                      ),
                                      Text(
                                        "FTY5YJ6N",
                                        style: GoogleFonts.poppins(
                                            fontSize: dimension.font15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.Colorq.withOpacity(
                                                0.8)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: dimension.height3,
                            ),
                            Divider(),
                            SizedBox(
                              height: dimension.height3,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.card_giftcard,
                                    color: AppColors.Colorq,
                                  ),
                                ),
                                SizedBox(
                                  width: dimension.height10,
                                ),
                                Container(
                                  //  color: Colors.deepPurple,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Discount",
                                        style: GoogleFonts.poppins(
                                            fontSize: dimension.font15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.Colorq.withOpacity(
                                                0.5)),
                                      ),
                                      SizedBox(
                                        height: dimension.height2,
                                      ),
                                      Text(
                                        "3",
                                        style: GoogleFonts.poppins(
                                            fontSize: dimension.font15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.Colorq.withOpacity(
                                                0.8)),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: dimension.height90,
                                ),
                                Container(
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: AppColors.Colorq,
                                  ),
                                ),
                                SizedBox(
                                  width: dimension.height10,
                                ),
                                Container(
                                  //  color: Colors.deepPurple,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Exp.Date",
                                        style: GoogleFonts.poppins(
                                            fontSize: dimension.font15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.Colorq.withOpacity(
                                                0.5)),
                                      ),
                                      SizedBox(
                                        height: dimension.height2,
                                      ),
                                      Text(
                                        "30 Sep, 2026",
                                        style: GoogleFonts.poppins(
                                            fontSize: dimension.font15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.Colorq.withOpacity(
                                                0.8)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: dimension.height3,
                            ),
                            Divider(),
                            SizedBox(
                              height: dimension.height3,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.circle_outlined,
                                    color: AppColors.Colorq,
                                  ),
                                ),
                                SizedBox(
                                  width: dimension.height10,
                                ),
                                Container(
                                  //  color: Colors.deepPurple,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status",
                                        style: GoogleFonts.poppins(
                                            fontSize: dimension.font15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.Colorq.withOpacity(
                                                0.5)),
                                      ),
                                      SizedBox(
                                        height: dimension.height2,
                                      ),
                                      Text(
                                        "Active",
                                        style: GoogleFonts.poppins(
                                            fontSize: dimension.font15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: dimension.height100+85,
                                ),
                                Container(
                                  height: dimension.height35,
                                  width: dimension.height60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(dimension.radius15),
                                      color: Colors.green.shade300),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: dimension.height5, bottom: dimension.height2+0.5),
                                        height: dimension.height30,
                                        width: dimension.height30,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
