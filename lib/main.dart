import 'package:flutter/material.dart';
import 'package:test1/ogenco_cat_title_logo.dart';
import 'package:test1/fish_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(flexibleSpace: const OgencoCatTitleLogo()),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return _buildBody(constraints);
          },
        ),
      ),
    );
  }

  Widget _buildBody(BoxConstraints constraints) {
    double width = constraints.maxWidth;
    double height = constraints.maxHeight;

    debugPrint('width=${constraints.maxWidth}');
    debugPrint('height=${constraints.maxHeight}');

    return SizedBox.fromSize(
      size: Size(width, height),
      child: Column(
        children: <Widget>[
          SizedBox.fromSize(
            size: Size(width * 0.5, height * 0.1),
            child: const FishButton(title: '下僕情報'),
          ),
          SizedBox.fromSize(
            size: Size(width * 0.5, height * 0.1),
            child: const FishButton(title: 'ねこさま情報'),
          ),
          SizedBox.fromSize(
            size: Size(width * 0.5, height * 0.1),
            child: const FishButton(title: 'うんこカレンダー'),
          ),
        ],
      ),
    );
  }
}
