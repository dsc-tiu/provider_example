import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/logic/news_model.dart';

class FutureProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newsList = Provider.of<List<NewsModel>>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Future Provider'),),
      body: SingleChildScrollView(
        child: Column(
          children: newsList == null?[Text('')]:newsList.map((news) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(news.title,style: TextStyle(
              fontSize: 20.0
            ),),
          ),).toList(),
        ),
      ),
    );
  }
}