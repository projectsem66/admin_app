
import 'package:admin_app/Pages/all_service.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class servise_Description extends StatefulWidget {
  const servise_Description({super.key});

  @override
  State<servise_Description> createState() => _servise_DescriptionState();
}

class _servise_DescriptionState extends State<servise_Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: dimension.height100 * 3 + 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/helper3.jpg"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: dimension.height15,
                        right: dimension.height12,
                        top: dimension.height50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(allservice());
                          },
                          child: Container(
                            height: dimension.height40,
                            width: dimension.height40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.Colorq.withOpacity(0.4)),
                            child: Icon(Icons.chevron_left,
                                size: dimension.icon25,
                                color: AppColors.Colorq),
                          ),
                        ),
                        Container(
                          height: dimension.height40,
                          width: dimension.height40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.Colorq.withOpacity(0.4)),
                          child: Icon(Icons.more_horiz,
                              size: dimension.icon25, color: AppColors.Colorq),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: dimension.height100 * 3,
                      left: dimension.height25,
                      right: dimension.height25),
                  height: dimension.height100 + 67,
                  width: dimension.height100 * 3 + 45,
                  decoration: BoxDecoration(
                      color: AppColors.Colorq.withOpacity(0.09),
                      borderRadius: BorderRadius.circular(dimension.radius15)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: dimension.height12, right: dimension.height12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: dimension.height15),
                          child: Row(
                            children: [
                              Text('Ac coolCare',
                                  style: GoogleFonts.poppins(
                                      fontSize: dimension.font13,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.Colorq)),
                              SizedBox(
                                width: dimension.height2,
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: AppColors.Colorq,
                              ),
                              SizedBox(
                                width: dimension.height2,
                              ),
                              Text("Ac Maintenance and Cleaning",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontWeight: FontWeight.bold,
                                    fontSize: dimension.font11,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: dimension.height8,
                        ),
                        Text("Filter Replacement",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontWeight: FontWeight.bold,
                                fontSize: dimension.font18)),
                        SizedBox(
                          height: dimension.height8,
                        ),
                        Text("Fr15.00",
                            style: GoogleFonts.poppins(
                                color: AppColors.Colorq,
                                fontWeight: FontWeight.bold,
                                fontSize: dimension.font15)),
                        SizedBox(
                          height: dimension.height8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Duration',
                              style: TextStyle(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.font12,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text("0:30 hour",
                                style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontWeight: FontWeight.w500,
                                    fontSize: dimension.font14)),
                          ],
                        ),
                        SizedBox(
                          height: dimension.height8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rating',
                              style: TextStyle(
                                  color: AppColors.Colorq,
                                  fontSize: dimension.font12,
                                  fontWeight: FontWeight.w300),
                            ),
                            Container(
                                child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.Colorq,
                                ),
                                SizedBox(
                                  width: dimension.height3,
                                ),
                                Text("4.4",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontWeight: FontWeight.w400,
                                        fontSize: dimension.font14)),
                              ],
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: dimension.height20, left: dimension.height15),
              child: Text("Description",
                  style: GoogleFonts.poppins(
                      color: AppColors.Colorq,
                      fontWeight: FontWeight.bold,
                      fontSize: dimension.font15)),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: dimension.height12, top: dimension.height10),
              child: Container(
                margin: EdgeInsets.only(right: dimension.height15),
                child: Text(
                  "Breathe clean air. We proptly replace filters, imporovig air quality and ensuring efficient circulation throughout your space. 👨🏼‍🔧🔩🪛",
                  style: TextStyle(
                      color: AppColors.Colorq,
                      fontWeight: FontWeight.w300,
                      fontSize: dimension.font12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: dimension.height20, left: dimension.height12),
              child: Text("About  Provider",
                  style: GoogleFonts.poppins(
                      color: AppColors.Colorq,
                      fontWeight: FontWeight.bold,
                      fontSize: dimension.font15)),
            ),
            SizedBox(
              height: dimension.height15,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: dimension.height12, right: dimension.height12),
              width: double.maxFinite,
              height: dimension.height100 * 2,
              decoration: BoxDecoration(
                color: AppColors.Colorq.withOpacity(0.1),
                borderRadius: BorderRadius.circular(dimension.radius15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: dimension.height18, left: dimension.height12),
                        height: dimension.height60,
                        width: dimension.height60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors.green,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/provider2.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: dimension.height12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Felix Harris",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.Colorq,
                                        fontWeight: FontWeight.bold,
                                        fontSize: dimension.font15)),
                                SizedBox(
                                  width: dimension.height100 + 40,
                                ),
                                Container(
                                  height: dimension.height30,
                                  width: dimension.height30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.Colorq,
                                  ),
                                  child: Center(
                                      child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: dimension.height1,
                            ),
                            Row(
                              children: [
                                Icon(
                                  (Icons.star),
                                  color: AppColors.Colorq,
                                  size: dimension.icon17,
                                ),
                                SizedBox(
                                  width: dimension.height2,
                                ),
                                Icon(
                                  (Icons.star),
                                  color: AppColors.Colorq,
                                  size: dimension.icon17,
                                ),
                                SizedBox(
                                  width: dimension.height2,
                                ),
                                Icon(
                                  (Icons.star),
                                  color: AppColors.Colorq,
                                  size: dimension.icon17,
                                ),
                                SizedBox(
                                  width: dimension.height2,
                                ),
                                Icon(
                                  (Icons.star),
                                  color: AppColors.Colorq,
                                  size: dimension.icon17,
                                ),
                                SizedBox(
                                  width: dimension.height2,
                                ),
                                Icon(
                                  (Icons.star),
                                  color: AppColors.Colorq,
                                  size: dimension.icon17,
                                ),
                                SizedBox(
                                  width: dimension.height2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: dimension.height12,
                        left: dimension.height12,
                        right: dimension.height12),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                              ),
                              SizedBox(width: dimension.height10),
                              Text("demo@provider.com",
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontSize: dimension.font13,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: dimension.height7,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: dimension.height10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                              ),
                              SizedBox(width: dimension.height10),
                              Text("North Battleford, SK, canaad",
                                  style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.font13,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: dimension.height7,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: dimension.height10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.call,
                              ),
                              SizedBox(width: dimension.height10),
                              Text("9104892220",
                                  style: GoogleFonts.poppins(
                                    color: AppColors.Colorq,
                                    fontSize: dimension.font13,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: dimension.height35,
            ),
          ],
        ),
      ),
    );
  }
}
