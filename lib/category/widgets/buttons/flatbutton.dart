import 'package:flutter/material.dart';
import 'package:flutter_dojo/common/main_title_widget.dart';

class FlatButtonWidget extends StatefulWidget {
  @override
  _FlatButtonWidgetState createState() => _FlatButtonWidgetState();
}

class _FlatButtonWidgetState extends State<FlatButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MainTitleWidget('FlatButton基本使用'),
        TextButton(
          onPressed: () {},
          child: Text('FlatButton'),
        ),
        MainTitleWidget('FlatButton In ButtonBar'),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: Text('FlatButton'),
            ),
            TextButton(
              onPressed: null,
              child: Text('FlatButton Disabled'),
            ),
          ],
        ),
        MainTitleWidget('Custom FlatButton'),
        TextButton(
          // 文本内容
          child: Text(
            'Custom FlatButton',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          // 按钮颜色
          style: TextButton.styleFrom(
            padding:
                EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
            // 按钮亮度
            backgroundColor: Colors.cyan,
            // 失效时的背景色
            disabledForegroundColor: Colors.grey,
            // 按钮失效时的文字颜色，同样的不能使用文本自己的样式或者颜色时才会起作用
            disabledBackgroundColor: Colors.grey,
            // shape: Border.all(
            //   // 设置边框样式
            //   color: Colors.grey,
            //   width: 2.0,
            //   style: BorderStyle.solid,
            // ),
          ),
          clipBehavior: Clip.antiAlias,
          onPressed: () {},
        ),
        TextButton(
          onPressed: () {},
          child: Text('CircleBorder'),
          // textColor: Colors.white,
          // textTheme: ButtonTextTheme.normal,
          // color: Theme.of(context).primaryColor,
          // splashColor: Colors.pink,
          // highlightColor: Colors.pink,
          // padding: EdgeInsets.all(30.0),
          // shape: CircleBorder(
          //   side: BorderSide(color: Colors.green),
          // ),
        ),
        TextButton(
          // color: Colors.blue,
          // textColor: Colors.white,
          // highlightColor: Colors.green,
          child: Text('改变文本颜色、背景颜色、高亮颜色'),
          onPressed: () {},
        ),
        TextButton(
          // disabledColor: Colors.grey,
          // disabledTextColor: Colors.black,
          child: Text('不可点击'),
          onPressed: null,
        ),
        TextButton.icon(
          // splashColor: Colors.orange,
          // shape: StadiumBorder(),
          icon: Icon(Icons.more),
          label: Text('添加了小图标(FlatButton.icon)'),
          onPressed: () {},
        ),
      ],
    );
  }
}
