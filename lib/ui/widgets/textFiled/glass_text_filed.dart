import 'package:flutter/material.dart';
import 'package:music_app/ui/constant/color_constant.dart';

class GlassTextFiled extends StatelessWidget {
  const GlassTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(8).copyWith(top: 4),
      decoration: BoxDecoration(
          color: ColorConstant.glassBackground.withOpacity(.5),
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        cursorColor: ColorConstant.bottomNavigationDeselectIconColor,
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIconColor: ColorConstant.bottomNavigationDeselectIconColor,
        ),
      ),
    );
  }
}
