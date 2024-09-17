import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:news_feed/screens/news_feed_screen.dart';
import 'package:provider/provider.dart';
import 'models/article_adapter.dart';
import 'providers/news_provider.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      home: NewsFeedScreen(),
    );
  }
}
