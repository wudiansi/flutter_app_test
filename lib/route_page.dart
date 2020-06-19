import 'package:flutter/material.dart';
import 'package:flutterapptest/data_type.dart';
import 'package:flutterapptest/flutter_layout_page.dart';
import 'package:flutterapptest/function_learn.dart';
import 'package:flutterapptest/generic_learn.dart';
import 'package:flutterapptest/lesson_group_page.dart';
import 'package:flutterapptest/oop_learn.dart';
import 'package:flutterapptest/plugin_use.dart';
import 'package:flutterapptest/statefull_group_page.dart';
//import 'package:flutterapptest/oop_learn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '使用route 路由导航',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page Test'),
      routes: <String, WidgetBuilder>{
        "less": (BuildContext context) => LessonGroupPage(),
        "layout": (BuildContext context) => FlutterLayoutPages(),
        "plugin": (BuildContext context) => PluginUse(),
        "ful": (BuildContext context) => StatefulGroup(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName ? '' : '不'}通过路由名跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('less page', LessonGroupPage(), 'less'),
          _item('layout page', FlutterLayoutPages(), 'layout'),
          _item('plugin page', PluginUse(), 'plugin'),
          _item('ful page', StatefulGroup(), 'ful'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if(byName){
            Navigator.pushNamed(context, routeName);
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
