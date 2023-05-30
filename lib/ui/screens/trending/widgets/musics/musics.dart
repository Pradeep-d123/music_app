import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/home/trendingController/trending_controller.dart';
import 'package:music_app/ui/constant/color_constant.dart';

class Musics extends StatelessWidget {
  Musics({super.key});
  final TrendingController trendingController = Get.put(TrendingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trendingController.types.length,
            itemBuilder: (context, index) => Obx(() => _type(
                text: trendingController.types[index],
                isActive: index == trendingController.selectedIndex.value,
                onTap: () {
                  trendingController.updateTypesIndex(index);
                })),
          ),
        ),
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemCount: trendingController.songs.length,
                itemBuilder: (context, index) => ListTile(
                      leading: SizedBox(
                        width: Get.width * .15,
                        height: Get.width * .15,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              trendingController.songs[index].posterImagePath,
                              fit: BoxFit.cover,
                            )),
                      ),
                      title: Text(
                        trendingController.songs[index].movieName,
                        style: TextStyle(
                            color: ColorConstant.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                          trendingController.songs[index].musicDirector ?? "",
                          style: TextStyle(
                              color: ColorConstant
                                  .bottomNavigationDeselectIconColor,
                              fontWeight: FontWeight.w500)),
                      trailing: Obx(() => IconButton(
                          onPressed: () {
                            if (trendingController.favoritesController
                                .isFav(trendingController.songs[index].id)) {
                              trendingController.favoritesController
                                  .removeFavorites(
                                      trendingController.songs[index]);
                            } else {
                              trendingController.favoritesController
                                  .addFavorites(
                                      trendingController.songs[index]);
                            }
                          },
                          icon: trendingController.favoritesController
                                  .isFav(trendingController.songs[index].id)
                              ? Icon(Icons.favorite, color: ColorConstant.red)
                              : Icon(Icons.favorite_border,
                                  color: ColorConstant
                                      .bottomNavigationActiveIconColor))),
                    )))
      ],
    );
  }

  Widget _type(
      {required String text,
      required bool isActive,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(10),
        decoration: isActive
            ? BoxDecoration(
                gradient: LinearGradient(colors: [
                  ColorConstant.typesBg1,
                  ColorConstant.typesBg2,
                ]),
                borderRadius: BorderRadius.circular(10))
            : null,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: isActive
                  ? ColorConstant.textColor
                  : ColorConstant.bottomNavigationActiveIconColor),
        )),
      ),
    );
  }
}
