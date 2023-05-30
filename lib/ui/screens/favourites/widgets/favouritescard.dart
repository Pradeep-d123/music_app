import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/models/home/music_model.dart';
import 'package:music_app/ui/constant/color_constant.dart';

class Favouritescard extends StatelessWidget {
  const Favouritescard({super.key, required this.music});
  final Music music;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Get.height * .2,
          decoration: BoxDecoration(
              color: ColorConstant.bottomNavigationDeselectIconColor,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(music.posterImagePath))),
        ),
        const SizedBox(height: 10),
        Text(
          music.movieName,
          style: TextStyle(color: ColorConstant.textColor),
        ),
        Text(music.songName,
            style: TextStyle(
                color: ColorConstant.bottomNavigationDeselectIconColor))
      ],
    );
  }
}
