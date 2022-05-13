import 'package:flutter/material.dart';
import 'package:test1/ogenco_cat_title_logo.dart';
import 'package:test1/fish.dart';

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
        body: Container(
          padding: const EdgeInsets.all(8),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return _buildBody(constraints);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BoxConstraints constraints) {
    double width = constraints.maxWidth;
    double height = constraints.maxHeight * (7 / 10) / 3;

    if (height > width / Fish.fishSizeAspect) {
      height = width / Fish.fishSizeAspect;
    }

    double imageHeight = constraints.maxHeight * (3 / 10);
    return SizedBox.fromSize(
      size: Size(constraints.maxWidth, constraints.maxHeight),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildFish('うんこカレンダー', width, height),
              _buildFish('ねこさま情報', width, height),
              _buildFish('下僕情報', width, height),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: <Widget>[
                const Spacer(),
                Image.asset('assets/images/unco.png',
                    height: imageHeight,
                    width: imageHeight * 0.4,
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomRight),
                Image.asset('assets/images/cat_image.png',
                    height: imageHeight, fit: BoxFit.contain),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFish(String title, double parentWidth, double parentHeight) {
    double width = parentWidth * 0.8;
    double height = parentHeight * 0.90;

    BoxFit fit = width / height > Fish.fishSizeAspect
        ? BoxFit.fitHeight
        : BoxFit.fitWidth;
    return SizedBox.fromSize(
      size: Size(parentWidth, parentHeight),
      child: FittedBox(
        fit: fit,
        child: Fish(title: title),
      ),
    );
  }
}
