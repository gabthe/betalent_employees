import 'dart:convert';

class Employee {
  String id;
  String name;
  String job;
  String admissionDate;
  String phone;
  String image;
  Employee({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'job': job,
      'admission_date': admissionDate,
      'phone': phone,
      'image': image,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] as String,
      name: map['name'] as String,
      job: map['job'] as String,
      admissionDate: map['admission_date'] as String,
      phone: map['phone'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);
}
