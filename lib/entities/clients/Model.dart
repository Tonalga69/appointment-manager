class ClientModel {
  int id;
  String name;
  int age;

  ClientModel({
    required this.id,
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
}

class ClientTable{
  static const String table = 'CREATE TABLE clients(id INTEGER AUTOINCREMENT PRIMARY KEY, name TEXT, age INTEGER);';
}

