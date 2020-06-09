class TestFunction {
  FunctionLearn functionLearn = FunctionLearn();
  void start() {
    print(functionLearn.sum(1, 2));
    functionLearn.anonymousFunction();// 调用匿名函数
  }
}

class FunctionLearn {
//  方法构成 方法名 返回值  参数
//  返回值类型可缺省 可为void 或者具体类型
//  匿名方法不需要方法名 其他都需要方法名
//  参数 参数类型:参数名 (必须参数 非必须参数)

  int sum( int val1, int val2) {
    return val1 + val2;
  }

  _learn() {
  //  私有方法
  //  _开头 作用域局部
    print('private function');
  }

  anonymousFunction () {
    var list = ['私有方法', '匿名方法'];
    //  这里就调用了一个匿名函数 参数为i 参数未指定参数类型
    list.forEach((i) {
      print(list.indexOf(i).toString()+ ':'+ i);
    });
  }
}