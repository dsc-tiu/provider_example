import 'package:flutter/material.dart';


class NewsList {
  final List<NewsModel> newsList;

  NewsList(this.newsList);

  NewsList.fromJson(List<dynamic> usersJson)
      : newsList = usersJson.map(
          (news) => NewsModel.fromJson(news)).toList();
}

class NewsModel {
  final String title;

  const NewsModel({@required this.title});

  NewsModel.fromJson(Map<String, dynamic> json)
      :this.title = json['title'];
}

class StreamNewsList {
  final List<StreamNewsModel> streamNewsList;

  StreamNewsList(this.streamNewsList);

  StreamNewsList.fromJson(List<dynamic> usersJson)
      : streamNewsList = usersJson.map(
          (news) => StreamNewsModel.fromJson(news)).toList();
}

class StreamNewsModel {
  final String title;

  const StreamNewsModel({@required this.title});

  StreamNewsModel.fromJson(Map<String, dynamic> json)
      :this.title = json['title'];
}