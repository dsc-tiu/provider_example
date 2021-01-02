import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/logic/news_model.dart';

class StreamProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var newsList = Provider.of<List<StreamNewsModel>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('StreamProvider Provider'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: newsList != null?newsList
              .map(
                  (e) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    e.title,
                    style: TextStyle(fontSize: 20.0),
                  ))).toList():[CircularProgressIndicator()],
        ),
      ),
    );
  }
}

