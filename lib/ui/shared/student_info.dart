class Student {
  String email = 'm.huzaifah@mail';
  String phone = '999';

  Student({this.email, this.phone});

  Student.copy(Student from) : this(email: from.email, phone: from.phone);

}
