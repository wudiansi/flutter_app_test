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
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何创建和使用Flutter的路由与导航？'),
//          左侧weiget Gesture 手势监听器
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        "less": (BuildContext context) => LessonGroupPage(),
        "layout": (BuildContext context) => FlutterLayoutPages(),
        "plugin": (BuildContext context) => PluginUse(),
        "ful": (BuildContext context) => StatefulGroup(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
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
