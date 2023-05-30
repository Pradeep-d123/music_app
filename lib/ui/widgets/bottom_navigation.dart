import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/home/bottomNavigationController/bottom_navigation_controller.dart';
import 'package:music_app/ui/constant/color_constant.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController bottomNavigationController =
        Get.find<BottomNavigationController>();

    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
        child: Container(
          margin: const EdgeInsets.all(20.0),
          height: Get.height * .085,
      
          decoration: BoxDecoration(
              color: ColorConstant.bottomNavigationBg.withOpacity(.3),
              borderRadius: BorderRadius.circular(18)),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navigationIcon(
                    icon: Icons.home_outlined,
                    isActive:
                        bottomNavigationController.selectedIndex.value == 0,
                    onTap: () {
                      bottomNavigationController.updateSelectedIndex(0);
                    }),
                navigationIcon(
                    icon: Icons.search,
                    isActive:
                        bottomNavigationController.selectedIndex.value == 1,
                    onTap: () {
                      bottomNavigationController.updateSelectedIndex(1);
                    }),
                navigationIcon(
                    icon: Icons.music_note_rounded,
                    isActive:
                        bottomNavigationController.selectedIndex.value == 2,
                    onTap: () {
                      bottomNavigationController.updateSelectedIndex(2);
                    }),
                navigationIcon(
                    icon: Icons.person_2_outlined,
                    isActive:
                        bottomNavigationController.selectedIndex.value == 3,
                    onTap: () {
                      bottomNavigationController.updateSelectedIndex(3);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navigationIcon(
      {required IconData icon,
      required bool isActive,
      required VoidCallback onTap}) {
    return IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: isActive
              ? ColorConstant.bottomNavigationActiveIconColor
              : ColorConstant.bottomNavigationDeselectIconColor,
          size: 30,
        ));
  }
}
