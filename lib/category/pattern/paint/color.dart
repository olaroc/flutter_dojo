import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class ColorWidget extends StatefulWidget {
  @override
  _ColorWidgetState createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  @override
  Widget build(BuildContext context) {
    var color = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MainTitleWidget('Color Luminance'),
          Container(
            color: color,
            padding: EdgeInsets.all(16),
            child: Text(
              'Luminance',
              style: TextStyle(
                fontSize: 30,
                color: color.computeLuminance() > 0.5 ? Colors.white : Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text('change color luminance'),
          ),
          MainTitleWidget('MaterialColor'),
          for (int i = 1; i < 10; i++) ...[
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.blue[100 * i],
              child: Center(
                  child: Text(
                formatColorString(Colors.blue[100 * i]),
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
          MainTitleWidget('Hex Color'),
          Container(
            width: 100,
            height: 100,
            color: HexColor('#8A98E8'),
            child: Text('#8A98E8'),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  String formatColorString(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
