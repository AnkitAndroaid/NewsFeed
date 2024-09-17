# News Feed App

This is a Flutter-based News Feed application that fetches news articles from a public API and displays them in a paginated list. The app also supports offline caching using Hive, pull-to-refresh, and is optimized for smooth scrolling and responsive layouts for tablets.

Features
  * Fetches and displays news articles from a public API.
	*	Supports infinite scrolling with pagination.
	*	Offline caching using Hive to display articles even when there’s no network connection.
	*	Pull-to-refresh functionality to manually refresh the news feed.
	*	Responsive UI design for different tablet sizes.
	*	Error handling and retry mechanism for failed API requests.
	*	Loading indicators to provide feedback during data fetching.


## How to Setup
### Steps:
  * Clone git repo https://github.com/AnkitAndroaid/NewsFeed.git
  *	Open project through Android studio/compatible IDE
  *	In terminal run 'flutter pub get' command
  *	In case you want to replace your_newsapi_key with your actual NewsAPI key in the file services/news_service.dart
  *	In terminal run 'flutter pub get' command
  *	In terminal run 'flutter run' command

## Libraries used:	
  *	**http:** Used to make HTTP requests to the News API.
	*	**provider:** Manages state in the app. It uses ChangeNotifier for state management.
  *	**hive:** A lightweight and fast key-value store used to implement offline caching.
	*	**hive_flutter:** Integration of Hive for Flutter for storing news articles.
	*	**path_provider:** Used to get the directory paths to store Hive files.

## Architecture
The app follows a layered architecture that divides responsibilities across different layers, keeping the codebase modular and maintainable.


