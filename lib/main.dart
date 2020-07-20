import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutterapptest/function_learn.dart';
import 'package:flutterapptest/generic_learn.dart';
import 'package:flutterapptest/oop_learn.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(LogoApp());
}

class AnimationLogo extends AnimatedWidget {
  AnimationLogo({Key key, Animation<double> animation})
    : super(key: key, listenable: animation); // listenable animation

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }
  
}
class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationState;

  double animationValue;
  @override
  void initState() {
    super.initState();
    // SingleTickerProviderStateMixin vsync 可隐藏时不动画
    controller =
        new AnimationController(vsync: this, duration: const Duration(seconds: 2));
    //  为动画添加listener .. 表示返回值 等效于animation.XXX
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
//      ..addListener(() {
//        //  获取变化中的值
//        setState(() {
//          animationValue = animation.value;
//        });
//      })
//      ..addStatusListener((AnimationStatus state) {
//        setState(() {
//          animationState = state;
//        });
//      });
  }

  @override
  Widget build(BuildContext context) {
    return new AnimationLogo(animation: animation);
//    return Container(
//      child: Column(
//        children: <Widget>[
//          GestureDetector(
//            // 点击按钮 点击初始化 然后触发
//            onTap: (){
//              controller.reset();
//              controller.forward();
//            },
//            child: Text('start', textDirection: TextDirection.ltr, style: TextStyle(fontSize: 40),),
//          ),
//          Text('State: ' + animationState.toString(), textDirection: TextDirection.ltr,),
//          Text('Value: ' + animationValue.toString(), textDirection: TextDirection.ltr,),
//          Container(
//            width: animation.value,
//            height: animation.value,
//            child: FlutterLogo(),
//          )
//        ],
//      ),
//    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
