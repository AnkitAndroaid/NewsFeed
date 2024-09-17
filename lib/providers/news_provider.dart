import 'package:flutter/material.dart';
import '../services/news_service.dart';
import '../services/cache_manager.dart';
import '../models/article.dart';

class NewsProvider extends ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;
  bool _hasError = false;
  int _currentPage = 1;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  final NewsService _newsService = NewsService();
  final CacheManager _cacheManager = CacheManager();

  NewsProvider() {
    _cacheManager.init();
    fetchArticles();
  }

  Future<void> fetchArticles({bool isRefresh = false}) async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    if (isRefresh) {
      _articles.clear();
      _currentPage = 1;
    }

    try {
      List<Article> fetchedArticles = await _newsService.fetchArticles(_currentPage);
      _articles.addAll(fetchedArticles);
      _currentPage++;
      await _cacheManager.cacheArticles(_articles);
    } catch (error) {
      _hasError = true;
      _articles = await _cacheManager.getCachedArticles();
    }

    _isLoading = false;
    notifyListeners();
  }
}