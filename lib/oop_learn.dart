// 定义一个class
class Student extends Person {
  String _school; // 通过下划线标识为私有变量 其他是无法访问的变量
  final city;
  String country;
  String name;

  // get 访问私有变量
  // ignore: unnecessary_getters_setters
  String get school => _school;

  // ignore: unnecessary_getters_setters
  set school(String value) {
    _school = value;
  }

  static doPrint(String str) {
    print('doPrint: $str');
  }
  // 初始化子类 super调用父类方法 ： 后面类的初始化列表
  //  this._school初始化自身所需 school， name age则为父级初始化
  //  {}中的为可选参数 其中 = 可以设置为默认参数 如：this.country = 'guangzhou'
  Student(this._school, String name, int age,
      {this.city, this.country = 'guangzhou'})
      :
        // 初始化列表  时可以设置其中的实例变量 如name
        name = '$country.$city',
        //  如果父类没有默认的构造方法（无参的构造方法） 则需要在初始列表中调用父类的构造方法进行初始化
        super(name, age) {
    //    构造方法不是必须的
    print('构造方法不是必须的');
  }

  //  命名构造方法 [类名+.+方法名]
  //  有final 就已经被初始化city this.city
  Student.cover(Student stu, this.city) : super(stu.name, stu.age) {
    //  构造体
    print('命名构造方法');
  }

  //  命名工厂构造方法 [类名+.+方法名]
  //  他可以有返回值 且不需要将类的final变量作为参数(如city 是不需要在作为参数的)、是一种灵活的获取类对象的方式
  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age);
  }

  // 快速重写父类方法快捷键ctrl+o
  @override
  String toString() {
    return 'name: $name, school: ${this.school}, city: $city, country: $country';
  }
}

//  工厂构造方法
class Logger {
  //  静态变量 实例变量
  static Logger _cache;

  //  工厂构造方法已经不单单只是一个构造方法 更是一种模式
  //  有时候为了返回之前已经创建的一个缓存对象 原始的构造方法已经不能满足需求
  //  那么可以使用工厂模式来定义构造方法
  factory Logger() {
    if (Logger._cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }

  Logger._internal();

  void log(String msg) {
    print('msg------------->$msg');
  }
}

class Person {
  String name;
  int age;

//  初始化
  Person(this.name, this.age);

  @override
  String toString() {
    // TODO: implement toString
    return 'name: $name, age: $age';
  }
}

//  继承抽象类需要实现它的抽象类方法  否则也需要将自己定义成抽象类
class StudyFlutter extends Study {
  @override
  // 实现抽象方法
  void study() {
    print('flutter learn');
  }

}

//  abstract 修饰符定义一个抽象类
//  该类不可被实例化 抽象类在接口定义时非常有用
abstract class Study{
  // 有方法声明  但是没有方法体
  void study();// 抽象类的抽象方法 为非必须的  如果有抽象方法 就必须要一定标识为抽象类 abstract
}

//  mixin 为类添加特征
//  多个类代码重用的的一种方式
//  mixin 必须继续自Object
//  使用mixin是在with关键字中承接一个或多个mixin 用逗号分割。
//  不声明任何构造方法，不调用 super

class Test extends Person with Study{
  Test(String name, int age) : super(name, age);

  @override
  void study() {
    print('mixin study');
  }

}
