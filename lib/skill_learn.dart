void main() {
  List list;

  //  1.安全调用
  print(list?.length); // 不确定的属性 加?.的方式访问  防止出现空异常

  //  2.调用默认值 ??
  print(list?.length??0); // 如果length 为空 默认值为0

  //  3.简化判断
  list = [];
  list.add(0);
  list.add('');
  list.add(null);

  if(list[0] == null || list[0] == '' || list[0] == 0){
    print('list[0] is empty');
  }

  if([null, 0, ''].contains(list[0])){
    print('list[0] is empty');
  }
}