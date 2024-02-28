
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class category_page extends StatefulWidget {
  const category_page({super.key});

  @override
  State<category_page> createState() => _category_pageState();
}

class _category_pageState extends State<category_page> {
  List providerimg = [
    'assets/images/provider1.jpg',
    'assets/images/provider3.jpg',
    'assets/i,mages/provider4.jpg',
  ];
  List providername = [
    'Katie Brown',
    'Fabian RAMOS NUNO',
    'Taxi Bouffe',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        leading: IconButton(
          onPressed: () {
            // Get.to(home_page());
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: dimension.icon30,
          ),
        ),
        title: Text("Category",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: dimension.height15),
            child: GestureDetector(
              onTap: () {
                // Get.to(couponadd());
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: screenheight(),
                child: GridView.builder(
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 4,childAspectRatio: 0.77),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(dimension.height7),
                      height: dimension.height100 * 2 + 20,
                      width: dimension.height60 * 3,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(dimension.height12)),
                      child: Column(
                        children: [
                          Container(
                            height: dimension.height100 + 50,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(providerimg[index]),
                                    fit: BoxFit.cover),
                                color: AppColors.Colorq.withOpacity(0.09),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      dimension.height12,
                                    ),
                                    topRight: Radius.circular(
                                        dimension.height12))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: dimension.height15,
                                  top: dimension.height10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: dimension.height40,
                                    width: dimension.height40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                        AppColors.Colorq.withOpacity(
                                            0.05)),
                                    child: Icon(
                                      Icons.power_settings_new_sharp,
                                      color: AppColors.lightGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: dimension.height70,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft:
                                  Radius.circular(dimension.height12),
                                  bottomRight: Radius.circular(
                                      dimension.height12)),
                              color: AppColors.Colorq.withOpacity(0.05),
                            ),
                            child: Column(
                              //  crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  providername[index],
                                  style: GoogleFonts.poppins(
                                      color: AppColors.Colorq,
                                      fontWeight: FontWeight.w500,
                                      fontSize: dimension.font15),
                                ),
                                SizedBox(
                                  height: dimension.height5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: dimension.height32,
                                      width: dimension.height32,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.Colorq
                                              .withOpacity(0.05)),
                                      child: Icon(Icons.call,
                                          color: AppColors.Colorq
                                              .withOpacity(0.9)),
                                    ),
                                    SizedBox(
                                      width: dimension.height15,
                                    ),
                                    Container(
                                      height: dimension.height32,
                                      width: dimension.height32,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.Colorq
                                              .withOpacity(0.05)),
                                      child: Icon(Icons.email_outlined,
                                          color: AppColors.Colorq
                                              .withOpacity(0.9)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: dimension.height3,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
