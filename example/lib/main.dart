import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Animation List Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> data = [
    {
      'title': '1111',
      'backgroundColor': Colors.grey,
    },
    {
      'title': '2222',
      'backgroundColor': Colors.red,
    },
    {
      'title': '3333',
      'backgroundColor': Colors.yellow,
    },
    {
      'title': '4444',
      'backgroundColor': Colors.blue,
    },
    {
      'title': '5555',
      'backgroundColor': Colors.green,
    },
    {
      'title': '6666',
      'backgroundColor': Colors.orange,
    },
    {
      'title': '7777',
      'backgroundColor': Colors.brown,
    },
    {
      'title': '8888',
      'backgroundColor': Colors.purple,
    },
  ];

  Widget _buildTile(String? title, Color? backgroundColor) {
    return Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: backgroundColor,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimationList(
            duration: 1500,
            reBounceDepth: 30,
            children: data.map((item) {
              return _buildTile(item['title'], item['backgroundColor']);
            }).toList()),
      ),
    );
  }
}
