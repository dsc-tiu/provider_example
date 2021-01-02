import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addition.dart';

class ChangeNotifierProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final addition = Provider.of<Addition>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Change Notifier Provider'),),
      body: Center(
        child: Text(addition.value.toString(),style: TextStyle(
          fontSize: 40.0,
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addition.increment();
        },
      ),
    );
  }
}