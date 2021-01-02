import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/logic/news_bloc.dart';
import 'change_notifier_provider/addition.dart';
import 'landing_screen.dart';

main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx)=>Addition(),
        ),
        FutureProvider(
          create: (ctx)=>NewsBloc().loadNews(),
        ),
        StreamProvider(
          create: (ctx)=>NewsBloc().getNewsStream(),
        ),
      ],
      child: MaterialApp(
        home: LandingScreen(),
      ),
    );
  }
}


