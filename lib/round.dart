
import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/material.dart';



class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loding;
  const RoundButton({super.key,
    required this.title, required this.onTap,
    this.loding = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: dimension.height50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.Colorq,
        ),
        child: Center(
          child:
          loding? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) :
          Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
        ),
      ),
    );
  }
}
