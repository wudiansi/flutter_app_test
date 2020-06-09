import 'package:flutterapptest/oop_learn.dart';

class TestGeneric{
  void start() {
    Cache<String>cache1 = Cache();
    cache1.setItem('key1', 'value1');
    String key1 = cache1.getItem('key1');
    print(key1);

    Cache<int>cache2 = Cache();
    cache2.setItem('key2', 2);
    int key2 = cache2.getItem('key2');
    print(key2);

    //  Member泛型定义为必须为Person类型 Student是继承自Person固可行
    Member<Student> member = Member(Student('', '', 28));
    print(member.fixedName());

    Member<Person> member2 = Member(Person('wds', 22));
    print(member2.fixedName());
  }
}

//  泛型类 类的复用性
//  解决类、接口、方法的复用性 以及不确定性数据的支持
//  此处的T 可以指定实例cache时的
class Cache<T>{
  static final Map<String, Object> _cache = Map();

//  泛型方法 void 指定了不返回
  void setItem(String key, T value){
    _cache[key] = value;
  }

//  T指定了返回为Type类型
  T getItem(String key) {
    return _cache[key];
  }
}

//  期望类型是某些指定类型 可以用泛型来约束需要得到的类型
class Member<T extends Person>{
  T _person;
  //  constructor 快捷键Alt+Insert
  Member(this._person);

  String fixedName() {
    return 'fixedName: ${_person.name}';
  }
}