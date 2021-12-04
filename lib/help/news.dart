import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:triveous_assignment/model/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=016418037eaf46ff98834585f697485e';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        var s = element['urlToImage'];
        if (s != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              author: element['author'],
              url: element['url'],
              publishedAt: element['publishedAt'],
              content: element['content']);
          news.add(articleModel);
        }
      });
    }
  }
}

class BusinessNews {
  List<ArticleModel> businessNews = [];

  Future<void> getNews1() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=016418037eaf46ff98834585f697485e';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        var s = element['urlToImage'];

        ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            author: element['author'],
            url: element['url'],
            publishedAt: element['publishedAt'],
            content: element['content']);
        businessNews.add(articleModel);
      });
    }
  }
}

class EntertainmentNews {
  List<ArticleModel> entertainmentNews = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=016418037eaf46ff98834585f697485e';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        var s = element['urlToImage'];

        ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            author: element['author'],
            url: element['url'],
            publishedAt: element['publishedAt'],
            content: element['content']);
        entertainmentNews.add(articleModel);
      });
    }
  }
}

class HealthNews {
  List<ArticleModel> healthNews = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=016418037eaf46ff98834585f697485e';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        var s = element['urlToImage'];

        ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            author: element['author'],
            url: element['url'],
            publishedAt: element['publishedAt'],
            content: element['content']);
        healthNews.add(articleModel);
      });
    }
  }
}

class ScienceNews {
  List<ArticleModel> scienceNews = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=016418037eaf46ff98834585f697485e';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        var s = element['urlToImage'];

        ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            author: element['author'],
            url: element['url'],
            publishedAt: element['publishedAt'],
            content: element['content']);
        scienceNews.add(articleModel);
      });
    }
  }
}

class SportsNews {
  List<ArticleModel> sportsNews = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=016418037eaf46ff98834585f697485e';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        var s = element['urlToImage'];

        ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            author: element['author'],
            url: element['url'],
            publishedAt: element['publishedAt'],
            content: element['content']);
        sportsNews.add(articleModel);
      });
    }
  }
}

class TechNews {
  List<ArticleModel> techNews = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=016418037eaf46ff98834585f697485e';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        var s = element['urlToImage'];

        ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            author: element['author'],
            url: element['url'],
            publishedAt: element['publishedAt'],
            content: element['content']);
        techNews.add(articleModel);
      });
    }
  }
}
