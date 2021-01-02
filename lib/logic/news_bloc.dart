import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import 'news_model.dart';

class NewsBloc {
  final String newsUrl =
      "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=your_api_key}";

  List<NewsModel> newsList;
  List<StreamNewsModel> streamNewsList;

  Future<List<NewsModel>> loadNews() async {
    var response = await http.get(Uri.encodeFull(newsUrl),
        headers: {"Accept": "application/json"});
    var jsonUserData = jsonDecode(response.body);
    newsList = NewsList.fromJson(jsonUserData['articles']).newsList;
    return newsList;
  }


  /*Some elements for Stream*/


  Future<List<StreamNewsModel>> streamNews() async {
    var response = await http.get(Uri.encodeFull(newsUrl),
        headers: {"Accept": "application/json"});
    var jsonUserData = jsonDecode(response.body);
    streamNewsList = StreamNewsList.fromJson(jsonUserData['articles']).streamNewsList;
    return streamNewsList;
  }

  final BehaviorSubject<List<StreamNewsModel>> _newsSubject = BehaviorSubject<List<StreamNewsModel>>();

  getNews()async{
    List<StreamNewsModel> newsResponse  = await streamNews();
    print(newsResponse.length);
    _newsSubject.sink.add(newsResponse);
  }


  BehaviorSubject<List<StreamNewsModel>> get newsSubject  => _newsSubject;

  Stream<List<StreamNewsModel>> getNewsStream(){
    getNews();
    return newsSubject.stream;
  }

  dispose(){
    _newsSubject.close();
  }
}

final newsBloc = NewsBloc();