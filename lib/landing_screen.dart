import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/future_provider/future_provider_screen.dart';
import 'package:provider_example/stream_provider/stream_provider_screen.dart';

import 'change_notifier_provider/addition.dart';
import 'change_notifier_provider/change_notifier_provider_screen.dart';


class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final addition = Provider.of<Addition>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              elevation: 20.0,
              onPressed: (){
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_)=>ChangeNotifierProviderScreen(),
                  ),
                );
              },
              color: Colors.red,
              height: 100.0,
              minWidth: 190.0,
              child: Text('Change Notifier',style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),),
            ),
            MaterialButton(
              elevation: 20.0,
              onPressed: (){
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_)=>FutureProviderScreen(),
                  ),
                );
              },
              color: Colors.teal,
              height: 100.0,
              minWidth: 190.0,
              child: Text('Future',style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),),
            ),
            MaterialButton(
              elevation: 20.0,
              onPressed: (){
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_)=>StreamProviderScreen(),
                  ),
                );
              },
              color: Colors.blueGrey,
              height: 100.0,
              minWidth: 190.0,
              child: Text('Stream',style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addition.increment();
        },
      ),
    );
  }
}