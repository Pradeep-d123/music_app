import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:music_app/controller/home/bottomNavigationController/bottom_navigation_controller.dart';
import 'package:music_app/controller/home/favourite_controller/favourite_controller.dart';
import 'package:music_app/ui/constant/color_constant.dart';
import 'package:music_app/ui/screens/favourites/widgets/favouritescard.dart';
import 'package:music_app/ui/widgets/button/glass_button.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});
  FavoritesController favoritesController = Get.find<FavoritesController>();
  @override
  Widget build(BuildContext context) {
    print(favoritesController.favourites.value);
    return Padding(
      padding: const EdgeInsets.all(25.0).copyWith(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(),
          const SizedBox(height: 30),
          Text(
            "Recent favourites ",
            style: TextStyle(
                color: ColorConstant.textColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Obx(
              () => favoritesController.favourites.value.length == 0
                  ? Center(
                      child: Text(
                        "Please add a favorites in dashboard to appear favorites here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                                ColorConstant.bottomNavigationDeselectIconColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    )
                  : GridView.builder(
                      itemCount: favoritesController.favourites.value.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15,
                          crossAxisCount: 2,
                          childAspectRatio: .7),
                      itemBuilder: (context, index) {
                        return Favouritescard(
                          music: favoritesController.favourites.value[index],
                        );
                      }),
            ),
          )
        ],
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        GlassIconButton(
          iconData: Icons.arrow_back_ios,
          onTap: () {
            Get.find<BottomNavigationController>().selectedIndex.value = 0;
          },
        ),
        const Spacer(),
        const GlassIconButton(iconData: Icons.favorite_outline),
      ],
    );
  }
}
