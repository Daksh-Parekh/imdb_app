import 'package:flutter/material.dart';
import 'package:imdb_app/screens/home_page/provider/home_provider.dart';
import 'package:imdb_app/screens/home_page/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: HomeProvider()..APICalling('Titanic')),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
