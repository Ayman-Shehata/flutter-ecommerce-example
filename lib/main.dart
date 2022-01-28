/*
This app to show you how to use list.generate
and list<map>
with appologise With apologies to Mr clean code and miss UI

 */

import 'package:flutter/material.dart';
import 'package:gridtile/Home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Cairo',
      ),
      home: const HomePage(),
    );
  }
}
