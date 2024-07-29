class Appointmentsmodel{
  int id;
  DateTime date;
  int clientId;
  String observation;
  String treatment;
  String diagnosis;


  Appointmentsmodel({
    required this.id,
    required this.date,
    required this.clientId,
    required this.observation,
    required this.treatment,
    required this.diagnosis,
  });

  factory Appointmentsmodel.fromJson(Map<String, dynamic> json) {
    return Appointmentsmodel(
      id: json['id'] as int,
      date: DateTime.parse(json['date']),
      clientId: json['clientId'] as int,
      observation: json['observation'] as String,
      treatment: json['treatment'] as String,
      diagnosis: json['diagnosis'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'clientId': clientId,
      'observation': observation,
      'treatment': treatment,
      'diagnosis': diagnosis,
    };
  }

}

