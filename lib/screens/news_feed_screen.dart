import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../models/article.dart';

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Provider.of<NewsProvider>(context, listen: false).fetchArticles();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.articles.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: () => provider.fetchArticles(isRefresh: true),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: provider.articles.length + (provider.isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.articles.length && provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                Article article = provider.articles[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.description),
                  leading: article.urlToImage != null
                      ? Image.network(article.urlToImage, width: 100)
                      : Icon(Icons.image),
                );
              },
            ),
          );
        },
      ),
    );
  }
}