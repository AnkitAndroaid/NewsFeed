import 'package:hive/hive.dart';
import '../models/article.dart';

class CacheManager {
  static const String boxName = 'newsCache';

  Future<void> init() async {
    await Hive.openBox<Article>(boxName);
  }

  Future<void> cacheArticles(List<Article> articles) async {
    var box = await Hive.openBox<Article>(boxName);
    await box.clear(); // Clear old cache before saving new articles
    await box.addAll(articles);
  }

  Future<List<Article>> getCachedArticles() async {
    var box = await Hive.openBox<Article>(boxName);
    return box.values.toList();
  }
}