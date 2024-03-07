import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class providerlist extends StatefulWidget {
  const providerlist({super.key});

  @override
  State<providerlist> createState() => _providerlistState();
}

class _providerlistState extends State<providerlist> {
  List providername = [
    'Katie Brown',
    'Fabian RAMOS NUNO',
    'Taxi Bouffe',
  ];

  List providerimg = [
    'assets/images/provider1.jpg',
    'assets/images/provider3.jpg',
    'assets/i,mages/provider4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Colorq,
        leading: IconButton(
          onPressed: () {
            //Get.to(drawer());
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: dimension.icon30,
          ),
        ),
        title: Text("Provider List",
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: dimension.font20)),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 12, right: 12.0),
        child: SingleChildScrollView(
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
                          borderSide:
                          const BorderSide(color: Color(0xffefeff7))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          const BorderSide(color: Color(0xffefeff7))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          const BorderSide(color: Color(0xffefeff7)))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 400,
                width: double.maxFinite,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
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
                                    topRight:
                                    Radius.circular(dimension.height12))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: dimension.height15,
                                  top: dimension.height10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: dimension.height40,
                                    width: dimension.height40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                        AppColors.Colorq),
                                    child: Icon(
                                      Icons.delete,
                                      color: AppColors.white1,
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
                                  bottomRight:
                                  Radius.circular(dimension.height12)),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: dimension.height32,
                                      width: dimension.height32,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.Colorq.withOpacity(
                                              0.05)),
                                      child: Icon(Icons.call,
                                          color: AppColors.Colorq.withOpacity(
                                              0.9)),
                                    ),
                                    SizedBox(
                                      width: dimension.height15,
                                    ),
                                    Container(
                                      height: dimension.height32,
                                      width: dimension.height32,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.Colorq.withOpacity(
                                              0.05)),
                                      child: Icon(Icons.email_outlined,
                                          color: AppColors.Colorq.withOpacity(
                                              0.9)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: dimension.height3,
                                )
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
