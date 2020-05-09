class Student {
  String email;
  String phone;

  Student({this.email, this.phone});

  Student.copy(Student from) : this(email: from.email, phone: from.phone);

}

final mockStudent = Student(email: 'aiman19@gmail.com', phone: '0199090090');