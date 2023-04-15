import 'package:bisiindo/page/content/category_kata.dart';
import 'package:bisiindo/page/content/main_page.dart';
import 'package:bisiindo/page/content/video.dart';
import 'package:bisiindo/page/home_page.dart';
import 'package:bisiindo/page/splash_page.dart';
import 'package:bisiindo/page/tentang.dart';
import 'package:bisiindo/page/widgets/search.dart';
import 'package:bisiindo/providers/product_provider.dart';
import 'package:bisiindo/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => homePage(),
          '/content': (context) => MainPage(),
          '/category': (context) => CategoryKata(),
          '/tentang': (context) => Tentang(),
          '/video': (context) => Video(),
        },
      ),
    );
  }
}
