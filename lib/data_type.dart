import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
//    _numType();
//    _stringType();
//    _booleanType();
//    _listType();
//    _mapType();
    _tips();
    return Container(
      child: Text('自个儿打印台看'),
    );
  }

  void _numType() {
    num num1 = -1.0;
    num num2 = 2;
    int int1 = 3;
    double db1 = 4.22;
    //  打印
    print('num1: $num1, num2: $num2, int1: $int1, db1: $db1');

    //  求绝对值
    print(num1.abs());
    //  取整数
    print(num1.toInt());
    //  转db
    print(num2.toDouble());
  }
}
// dynamic var object区别
void _tips() {
  dynamic xx = 'test'; // 动态数据类型

  print(xx.runtimeType);// 编译时才知道具体数据类型
  print(xx);
  xx = 123;
  print(xx.runtimeType);
  print(xx);

  String xx2 = 'test2';
  print(xx2.runtimeType);
  print(xx2);

  var xx3 = 'test3';
  print(xx3.runtimeType);
//  xx3 = 12; //var 是关键字 非动态类型 I

//  Object
  Object ob1 = '123';
  print(ob1.runtimeType);
  print(ob1);
}

void _mapType() {
  Map names = {'xm': '小明', 'xh': '小红'};
  Map age = {};
  age['xm'] = 15;
  age['xh'] = 17;

  print(names);
//  print(age);
  age.forEach((key, value) {
    print('$key: $value');
  });

  // 颠倒key value MapEntry
  Map age2 = age.map((key, value) {
    return MapEntry(value, key);
  });
  print(age2);

  for(var key in age2.keys ){
    print('value is : ${age2[key]}');
  }
}

void _listType() {
  print('---ListType---');
  List li1 = [1, 2, 3, '集合']; // 动态类型集合
  print(li1);

  List<int> li2 = []; // 指定类型
  List li3 = [];
//  li2 = li1;
//  li3 = li1;
  li3.add('li');
  li3.addAll(li1); // 复制进全部

  print(li3);

  // 集合生成函数 len func
  List li4 = List.generate(3, (index) => index * 2);
  print(li4);
  // 遍历
  for (int i = 0; i < li4.length; i++) {
    print(li4[i]);
  }
  // forEach
  li3.forEach((element) {
    print(element);
  });
}

void _booleanType() {
  bool success = true, fail = false;
  print('success: $success');
  print('fail: $fail');
  print(success || fail);
  print(success && fail);
}

void _stringType() {
  String str1 = 'fuck', str2 = "db fuck";
  String str3 = 'str1: $str1';
  String str4 = 'str2 db: ' + str2;
  print(str1 + '-' + str2 + '-' + str3 + '-' + str4);

  print(str4);
  // 字符串截取
  print(str4.substring(1, 4));
  print(str4.indexOf('b'));
}
