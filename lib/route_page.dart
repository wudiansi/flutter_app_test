import 'package:flutter/material.dart';
import 'package:flutterapptest/app_lifecycle.dart';
import 'package:flutterapptest/flutter_layout_page.dart';
import 'package:flutterapptest/flutter_widget_lifecycle.dart';
import 'package:flutterapptest/gesture_page.dart';
import 'package:flutterapptest/launch_page.dart';
import 'package:flutterapptest/lesson_group_page.dart';
import 'package:flutterapptest/plugin_use.dart';
import 'package:flutterapptest/res_page.dart';
import 'package:flutterapptest/statefull_group_page.dart';

void main() {
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '使用route 路由导航',
      theme: ThemeData(
        brightness: _brightness,
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何创建和使用Flutter的路由与导航？'),
//          左侧weiget Gesture 手势监听器
//          leading: GestureDetector(
//            onTap: (){
//              Navigator.pop(context);
//            },
//            child: Icon(Icons.arrow_back),
//          ),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  if( _brightness == Brightness.dark) {
                    _brightness = Brightness.light;
                  } else {
                    _brightness = Brightness.dark;
                  }
                });
              },
              child: Text('切换主题'),
            ),
            RouteNavigator()
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        "less": (BuildContext context) => LessonGroupPage(),
        "layout": (BuildContext context) => FlutterLayoutPages(),
        "plugin": (BuildContext context) => PluginUse(),
        "ful": (BuildContext context) => StatefulGroup(),
        "ges": (BuildContext context) => GesturePage(),
        "res": (BuildContext context) => ResPage(),
        "launch": (BuildContext context) => LaunchPage(),
        "lifecycle": (BuildContext context) => WidgetLifecycle(),
        "app_lifecycle": (BuildContext context) => AppLifeCycle(),
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
          _item('gesture page', GesturePage(), 'ges'),
          _item('res page', ResPage(), 'res'),
          _item('launch page', LaunchPage(), 'launch'),
          _item('lifecycle page', WidgetLifecycle(), 'lifecycle'),
          _item('app lifecycle page', AppLifeCycle(), 'app_lifecycle'),
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
