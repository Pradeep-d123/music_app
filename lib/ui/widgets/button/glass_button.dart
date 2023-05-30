import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/ui/constant/color_constant.dart';

class GlassIconButton extends StatelessWidget {
  const GlassIconButton({super.key, required this.iconData, this.onTap});
  final IconData iconData;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 50,
          child: Icon(
            iconData,
            color: ColorConstant.bottomNavigationActiveIconColor,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: ColorConstant.glassBackground.withOpacity(.5),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
