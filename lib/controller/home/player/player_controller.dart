import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class Player extends GetxController {
  AudioPlayer _audioPlayer = AudioPlayer();
  RxBool isPlaying = false.obs;

  void playAudio(String path) async {
    await _audioPlayer.play(AssetSource(path));
    isPlaying.value = true;
  }

  void stopAudio() async {
    await _audioPlayer.pause();
    isPlaying.value = false;
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
