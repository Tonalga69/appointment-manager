import 'package:objectbox/objectbox.dart';

import '../appointments/appointmentsModel.dart';

@Entity()
class ClientModel {
  @Id()
  int id;
  String name;
  int age;
  int? noteBookNumber;
  @Backlink()
  final appointments = ToMany<Appointmentsmodel>();

  ClientModel({
    this.id = 0,
    this.noteBookNumber,
    required this.name,
    required this.age,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}
