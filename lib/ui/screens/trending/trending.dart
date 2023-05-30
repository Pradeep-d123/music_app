import 'package:flutter/material.dart';
import 'package:music_app/ui/constant/color_constant.dart';
import 'package:music_app/ui/screens/trending/widgets/musics/musics.dart';
import 'package:music_app/ui/screens/trending/widgets/trendingCards/trending_cards.dart';
import 'package:music_app/ui/widgets/button/glass_button.dart';
import 'package:music_app/ui/widgets/textFiled/glass_text_filed.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0).copyWith(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Trending right Now",
            style: TextStyle(
                color: ColorConstant.textColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          TrendingMusicCards(),
          const SizedBox(
            height: 30,
          ),
          Expanded(child: Musics())
        ],
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: const [
        GlassIconButton(iconData: Icons.menu),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: GlassTextFiled(),
        )
      ],
    );
  }
}
