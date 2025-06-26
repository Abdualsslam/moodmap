import 'package:flutter/material.dart';
import 'package:mood_map/features/data/models/favorite_model.dart';

class FavoritesProvider extends ChangeNotifier {
  List<FavoriteQuote> _favorites = [];

  List<FavoriteQuote> get favorites => _favorites;

  FavoritesProvider() {
    // تحميل المفضلة عند الإنشاء
    loadFavorites();
  }

  void addFavorite(String text) {
    if (!_favorites.any((q) => q.text == text)) {
      _favorites.add(FavoriteQuote(text: text, addedAt: DateTime.now()));
      notifyListeners();
      // احفظ هنا إذا أردت
    }
  }

  void removeFavorite(String text) {
    _favorites.removeWhere((q) => q.text == text);
    notifyListeners();
    // احفظ هنا إذا أردت
  }

  bool isFavorite(String text) {
    return _favorites.any((q) => q.text == text);
  }
  // === دوال الحفظ والاسترجاع هنا ===

  Future<void> saveFavorites(List<FavoriteQuote> favorites) async {
    // هنا ضع كود SharedPreferences أو Hive
  }

  Future<void> loadFavorites() async {
    // هنا الاسترجاع من SharedPreferences أو Hive
    // ثم: _favorites = النتائج; notifyListeners();
  }
}
