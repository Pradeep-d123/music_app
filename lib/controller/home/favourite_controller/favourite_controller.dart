import 'package:get/get.dart';
import 'package:music_app/models/home/music_model.dart';

class FavoritesController extends GetxController {
  RxList<Music> favourites = <Music>[].obs;
  addFavorites(Music music) {
    favourites.add(music);
  }

  removeFavorites(Music music) {
    favourites.remove(music);
  }

  bool isFav(int id) {
    for (var i = 0; i < favourites.value.length; i++) {
      if (favourites.value[i].id == id) return true;
    }
    return false;
  }
}
