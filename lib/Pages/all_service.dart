
import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/Pages/servise_description.dart';
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:auto_scroll_text/auto_scroll_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class allservice extends StatefulWidget {
  const allservice({super.key});

  @override
  State<allservice> createState() => _allserviceState();
}

class _allserviceState extends State<allservice> {
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
            size:dimension.icon30,
          ),
        ),
        title: Text("All Service",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize:dimension.font20)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: dimension.height15),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: dimension.height15,
            left: dimension.height12,
            right: dimension.height12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimension.height13),
                  color: Color(0xffefeff7)),
              child: TextFormField(
                cursorColor: AppColors.Colorq,
                decoration: InputDecoration(
                    prefixIcon:
                        Icon(Icons.search_rounded, color: Colors.black26),
                    hintText: 'Search here....',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffefeff7))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffefeff7))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Color(0xffefeff7)))),
              ),
            ),
            SizedBox(
              height:dimension.height15,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const servisedes()));
                  },
                  child: GestureDetector(
                    onTap: () {
                      Get.to(servise_Description());
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: dimension.height100 * 3 + 2,
                          width: dimension.height100 + 72,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(dimension.height15),
                            //color: Colors.green
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: dimension.height100 * 2,
                                width: dimension.height100 + 67,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/helper3.jpg"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(dimension.height15),
                                      topLeft:
                                          Radius.circular(dimension.height15)),
                                  //  color: Colors.green,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dimension.height10,
                                          left: dimension.height7),
                                      child: Container(
                                        height: dimension.height30,
                                        width: dimension.height100 + 15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              dimension.radius12),
                                          color:
                                              AppColors.Colorq.withOpacity(0.4),
                                          // color: Colors.green
                                        ),
                                        child: Center(
                                          child: AutoScrollText(
                                              "Ac Maintenance and Cleaning",
                                              style: GoogleFonts.poppins(
                                                  color: AppColors.Colorq,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: dimension.height100,
                                width: dimension.height100 + 67,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight:
                                            Radius.circular(dimension.radius15),
                                        bottomLeft: Radius.circular(
                                            dimension.radius15)),
                                    color: AppColors.Colorq.withOpacity(0.08)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dimension.height15,
                                          left: dimension.height10),
                                      // child: RatingBar.builder(
                                      //   minRating: 1,
                                      //   itemSize: 20,
                                      //   itemBuilder: (context, index) {
                                      //     return Icon(
                                      //         Icons.star_border_sharp);
                                      //   },
                                      //   updateOnDrag: true,
                                      //   onRatingUpdate: (rating) {
                                      //     this.rating = rating;
                                      //   },
                                      // ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            (Icons.star),
                                            color: AppColors.Colorq,
                                            size: dimension.icon14,
                                          ),
                                          SizedBox(
                                            width: dimension.height1 + 0.3,
                                          ),
                                          Icon(
                                            (Icons.star),
                                            color: AppColors.Colorq,
                                            size: dimension.icon14,
                                          ),
                                          SizedBox(
                                            width: dimension.height1 + 0.3,
                                          ),
                                          Icon(
                                            (Icons.star),
                                            color: AppColors.Colorq,
                                            size: dimension.icon14,
                                          ),
                                          SizedBox(
                                            width: dimension.height1 + 0.3,
                                          ),
                                          Icon(
                                            (Icons.star),
                                            color: AppColors.Colorq,
                                            size: dimension.icon14,
                                          ),
                                          SizedBox(
                                            width: dimension.height1 + 0.3,
                                          ),
                                          Icon(
                                            (Icons.star),
                                            color: AppColors.Colorq.withOpacity(
                                                0.4),
                                            size: dimension.icon14,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: dimension.height7,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: dimension.height10),
                                      child: Text('Filter Replacement',
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontSize: dimension.font13,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      height: dimension.height7,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: dimension.height10),
                                          child: Container(
                                            height: dimension.height25,
                                            width: dimension.height25,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/provider2.jpg"),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: dimension.height7,
                                        ),
                                        Text('Felix Harris',
                                            style: GoogleFonts.poppins(
                                                color: AppColors.Colorq,
                                                fontSize: dimension.font10,
                                                fontWeight: FontWeight.w300)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: dimension.height100 + 83,
                              left: dimension.height73),
                          height: dimension.height30,
                          width: dimension.height85,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(dimension.height15),
                              border: Border.all(
                                  color: AppColors.Colorq.withOpacity(0.4),
                                  width: dimension.height2 + 0.5),
                              color: AppColors.Colorq),
                          child: Center(
                              child: Text('1000',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: dimension.font18))),
                        )
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   width: dimension.height5,
                // ),
                Stack(
                  children: [
                    Container(
                      height: dimension.height100 * 3 + 2,
                      width: dimension.height100 + 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(dimension.height15),
                        //color: Colors.green
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: dimension.height100 * 2,
                            width: dimension.height100 + 67,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/helper3.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(dimension.height15),
                                  topLeft: Radius.circular(dimension.height15)),
                              //  color: Colors.green,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: dimension.height10,
                                      left: dimension.height7),
                                  child: Container(
                                    height: dimension.height30,
                                    width: dimension.height100 + 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          dimension.radius12),
                                      color: AppColors.Colorq.withOpacity(0.4),
                                      // color: Colors.green
                                    ),
                                    child: Center(
                                      child: AutoScrollText(
                                          "Ac Maintenance and Cleaning",
                                          style: GoogleFonts.poppins(
                                              color: AppColors.Colorq,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: dimension.height100,
                            width: dimension.height100 + 67,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight:
                                        Radius.circular(dimension.radius15),
                                    bottomLeft:
                                        Radius.circular(dimension.radius15)),
                                color: AppColors.Colorq.withOpacity(0.08)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: dimension.height15,
                                      left: dimension.height10),
                                  // child: RatingBar.builder(
                                  //   minRating: 1,
                                  //   itemSize: 20,
                                  //   itemBuilder: (context, index) {
                                  //     return Icon(
                                  //         Icons.star_border_sharp);
                                  //   },
                                  //   updateOnDrag: true,
                                  //   onRatingUpdate: (rating) {
                                  //     this.rating = rating;
                                  //   },
                                  // ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        (Icons.star),
                                        color: AppColors.Colorq,
                                        size: dimension.icon14,
                                      ),
                                      SizedBox(
                                        width: dimension.height1 + 0.3,
                                      ),
                                      Icon(
                                        (Icons.star),
                                        color: AppColors.Colorq,
                                        size: dimension.icon14,
                                      ),
                                      SizedBox(
                                        width: dimension.height1 + 0.3,
                                      ),
                                      Icon(
                                        (Icons.star),
                                        color: AppColors.Colorq,
                                        size: dimension.icon14,
                                      ),
                                      SizedBox(
                                        width: dimension.height1 + 0.3,
                                      ),
                                      Icon(
                                        (Icons.star),
                                        color: AppColors.Colorq,
                                        size: dimension.icon14,
                                      ),
                                      SizedBox(
                                        width: dimension.height1 + 0.3,
                                      ),
                                      Icon(
                                        (Icons.star),
                                        color:
                                            AppColors.Colorq.withOpacity(0.4),
                                        size: dimension.icon14,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: dimension.height7,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: dimension.height10),
                                  child: Text('Filter Replacement',
                                      style: GoogleFonts.poppins(
                                          color: AppColors.Colorq,
                                          fontSize: dimension.font13,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  height: dimension.height7,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: dimension.height10),
                                      child: Container(
                                        height: dimension.height25,
                                        width: dimension.height25,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/provider2.jpg"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: dimension.height7,
                                    ),
                                    Text('Felix Harris',
                                        style: GoogleFonts.poppins(
                                            color: AppColors.Colorq,
                                            fontSize: dimension.font10,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: dimension.height100 + 83,
                          left: dimension.height85),
                      height: dimension.height30,
                      width: dimension.height80,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(dimension.height15),
                          border: Border.all(
                              color: AppColors.Colorq.withOpacity(0.4),
                              width: dimension.height2 + 0.5),
                          color: AppColors.Colorq),
                      child: Center(
                          child: Text('1000',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: dimension.font18))),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
