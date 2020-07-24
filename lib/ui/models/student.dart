class Student {
  String name;
  String matric;
  String email;
  String phone;
  String id;

  Student({this.name, this.matric, this.email, this.phone, this.id});

  Student.fromJson(Map<String, dynamic> json)
      : this(
            name: json['name'],
            matric: json['matric'],
            email: json['email'],
            phone: json['phone'],
            id: json['id'].toString());

  Map<String, dynamic> toJson() => {
        'name': name,
        'matric': matric,
        'email': email,
        'phone': phone,
        'id': id
      };
}

final mockStudent = Student(
    name: 'Muhammad Azwak Bin Azwak',
    matric: 'A17CS1111',
    email: 'aiman19@gmail.com',
    phone: '0199090090');
