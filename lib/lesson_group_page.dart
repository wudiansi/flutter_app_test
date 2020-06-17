import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

void main() => runApp(LessonGroupPage());

// rename 快捷键shift + F6
class LessonGroupPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lesson group page'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            )
          ],
        ),
//        drawer: new MyDrawer(),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                'page test',
                style: textStyle,
              ),
              Icon(
                Icons.android,
                size: 40,
                color: Colors.green,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                label: Text('peoples'),
//                padding: EdgeInsets.all(10),
              ),
              Divider(
//                无法设置分割线高度
                height: 10,
                indent: 10,
                color: Colors.black,
              ),
              Card(
                elevation: 5,
                color: Colors.blue,
                shadowColor: Colors.blue,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('This is a Card'),
                ),
              ),
              AlertDialog(
                title: Text('Dialog title'),
                content: Text('Dialog content'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
