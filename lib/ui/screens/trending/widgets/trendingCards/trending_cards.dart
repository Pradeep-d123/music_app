import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/models/home/music_model.dart';
import 'package:music_app/ui/constant/assets_constants.dart';
import 'package:music_app/ui/screens/trending/widgets/trendingCards/music_card.dart';

class TrendingMusicCards extends StatelessWidget {
  TrendingMusicCards({super.key});
  final List<Music> songs = [
    Music(
        id: 0,
        posterImagePath: AssetsConstants.song1Poster,
        songName: "Alan Walker - DarkSide ",
        songPath: AssetsConstants.song1,
        movieName: "The Dark Side",
        gradientColor: const [Color(0xFF79858C), Color(0xFF47544D)]),
    Music(
        id: 1,
        posterImagePath: AssetsConstants.song2Poster,
        songName: "Lady Gaga - Bloody Mary",
        songPath: AssetsConstants.song2,
        movieName: "Wednesday",
        gradientColor: const [Color(0xFF646693), Color(0xFF07071B)]),
    Music(
        id: 2,
        posterImagePath: AssetsConstants.song3Poster,
        songName: "Believe",
        songPath: AssetsConstants.song3,
        movieName: "Believe",
        gradientColor: const [Color(0xFF382537), Color(0xFF97F4F4)]),
    Music(
        id: 3,
        posterImagePath: AssetsConstants.song4Poster,
        songName: "CJ - Baby Driver(ERS Remix)",
        songPath: AssetsConstants.song4,
        movieName: "WHOOPTY",
        gradientColor: const [Color(0xFF43290B), Color(0xFFDEA721)]),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: Get.width * .45,
        child: PageView.builder(
            padEnds: false,
            controller: PageController(viewportFraction: .7),
            scrollDirection: Axis.horizontal,
            itemCount: songs.length,
            itemBuilder: (context, index) => MusicCard(
                  song: songs[index],
                )),
      ),
    );
  }
}
