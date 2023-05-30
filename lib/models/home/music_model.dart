import 'dart:ui';

class Music {
  int id;
  String songName;
  String songPath;
  String posterImagePath;
  String movieName;
  String? musicDirector;
  List<Color> gradientColor;
  Music(
      {required this.movieName,
      this.musicDirector,
      required this.id,
      required this.posterImagePath,
      required this.songName,
      required this.songPath,
      required this.gradientColor});
}
