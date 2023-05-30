import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controller/home/player/player_controller.dart';
import 'package:music_app/models/home/music_model.dart';
import 'package:music_app/ui/constant/color_constant.dart';

class MusicCard extends StatelessWidget {
  MusicCard({super.key, required this.song});
  late final Player player = Get.put(Player(), tag: song.id.toString());
  final Music song;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(song.posterImagePath),
              fit: BoxFit.cover,
              opacity: .75)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.more_horiz,
            color: ColorConstant.textColor,
          ),
          const Spacer(),
          _playUi()
        ],
      ),
    );
  }

  Widget _playUi() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: song.gradientColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomRight)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.movieName,
                  style: TextStyle(color: ColorConstant.textColor),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.music_note,
                      size: 13,
                      color: ColorConstant.textColor,
                    ),
                    Expanded(
                      child: Text(
                        "Music - ${song.songName}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10, color: ColorConstant.textColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (player.isPlaying.value) {
                player.stopAudio();
              } else {
                player.playAudio(song.songPath);
              }
            },
            child: CircleAvatar(
              maxRadius: 23,
              minRadius: 23,
              backgroundColor: ColorConstant.textColor,
              child: Obx(() => Icon(
                    player.isPlaying.value ? Icons.pause : Icons.play_arrow,
                    color: ColorConstant.black,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
