import 'package:appointments/entities/clients/Model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Appointmentsmodel {
  @Id()
  int id;
  DateTime date;
  final client = ToOne<ClientModel>();
  String? observation;
  String? treatment;
  String? diagnosis;

  Appointmentsmodel({
    this.id = 0,
    required this.date,
     this.observation,
     this.treatment,
     this.diagnosis,
  });

  factory Appointmentsmodel.fromJson(Map<String, dynamic> json) {
    return Appointmentsmodel(
      id: json['id'] as int,
      date: DateTime.parse(json['date']),
      observation: json['observation'] as String,
      treatment: json['treatment'] as String,
      diagnosis: json['diagnosis'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'observation': observation,
      'treatment': treatment,
      'diagnosis': diagnosis,
    };
  }
}
