import 'package:flutter/material.dart';
import 'package:music_app/controller/home/bottomNavigationController/bottom_navigation_controller.dart';
import 'package:music_app/ui/constant/color_constant.dart';
import 'package:get/get.dart';
import 'package:music_app/ui/screens/favourites/favourites.dart';
import 'package:music_app/ui/screens/trending/trending.dart';
import 'package:music_app/ui/widgets/bottom_navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              ColorConstant.backgroundGradientBg1,
              ColorConstant.backgroundGradientBg2
            ])),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Obx(() => body(bottomNavigationController.selectedIndex.value)),
            const CustomBottomNavigation()
          ],
        ),
      ),
    );
  }

  Widget body(int index) {
    switch (index) {
      case 0:
        return const Trending();
      case 1:
        return Favorites();
      default:
        return Container();
    }
  }
}
