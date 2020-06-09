
class Person {
  String firstName;
  String lastName;
  Person(this.firstName, this.lastName);
}

class Student extends Person {
//  String firstName;
//  String lastName;
  Student(String firstName,String lastName): super(firstName, lastName);
//   Student.cover(Student stu): super(stu.firstName, stu.lastName);
}

void main() {
  var a = new Student('firstName', 'lastName');
  print(a.firstName);
  // 打印 a.firstName = null
}
