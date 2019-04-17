import 'package:flutter/material.dart';
import 'package:flutter_animasi_login/Pages.dart';
import 'package:flutter_animasi_login/page_reveal.dart';
import 'package:flutter_animasi_login/pager_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Material Page Reavel',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Page(
            viewModel: pages[0],
            percentVisible: 1,
          ),
          new PageReveal(
            revealPercent: 1,
            child: new Page(
              viewModel: pages[2],
              percentVisible: 1.0,
            ),
          ),
          new PageIndicator(
            viewModel: new PagerIndicatorViewModel(pages, 1, SlideDirection.none, 0.0),
          ),
        ],
      ),
    );
  }
}
