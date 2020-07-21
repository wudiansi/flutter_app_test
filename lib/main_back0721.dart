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

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
//  构造方法
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
        child: child,
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
  Widget build(BuildContext context) => GrowTransition(
    child: LogoWidget(),
    animation: animation,
  );
//  {
//    return new AnimationLogo(animation: animation);
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
//  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
