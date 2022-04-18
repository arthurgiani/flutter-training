import 'dart:convert';

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      map['name'] ?? '',
      map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));
}
