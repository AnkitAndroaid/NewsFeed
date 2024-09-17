import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/article.dart';

class NewsService {
  final String apiKey = '<YOUR API KEY>';
  final String baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<List<Article>> fetchArticles(int page) async {
    final response = await http.get(Uri.parse('$baseUrl?country=us&page=$page&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['articles'];
      return jsonResponse.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news articles');
    }
  }
}