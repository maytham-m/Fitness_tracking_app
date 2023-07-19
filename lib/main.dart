import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/graph_data.dart';
import 'package:app/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GraphData(), // Providing GraphData to descendant widgets.
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Using HomePage as the first screen.
    );
  }
}
