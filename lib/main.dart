import 'package:flutter/material.dart';
import 'package:flutterapptest/function_learn.dart';
import 'package:flutterapptest/generic_learn.dart';
import 'package:flutterapptest/oop_learn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page Test'),
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

  @override
  Widget build(BuildContext context) {
//    _oopLearn();
    _functionLearn();
    _genericLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
//            DataType()
          ],
        ),
      ),
    );
  }
  void _oopLearn() {
    print('================');
//    Logger log1 = Logger();
//    Logger log2 = Logger();

    // 打印为true 表明返回的是一个单例
//    print(log1 == log2);
//
//    log1.log('11');
//    log2.log('22');
      Student.doPrint('__oopLearn');
    Student st1 = Student('清华', 'wds', 22);
    st1.school = '985';// 设置私有变量
    print('st1-------------->${st1.toString()}');

    // 非必须参数 尝试用 参数名：值的形式传入
    Student st2 = Student('北大', 'wwr', 23, city: 'sjz', country: 'zg');
    print('st2-------------->$st2');

    //  调用抽象类的抽象方法
    StudyFlutter studyFlutter = StudyFlutter();
    studyFlutter.study();

    Test test = Test('北大', 11);
    test.study();

//    Student st3 = Student.stu(st1);
//    print('st3-------------->$st3');
  }

  void _functionLearn() {
    TestFunction testFunction = TestFunction();
    testFunction.start();
  }

  void _genericLearn() {
    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }
}
