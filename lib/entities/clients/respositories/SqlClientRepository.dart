import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/entities/global_repositories/SqlnitializerRepository.dart';
import 'package:get/get.dart';


class SqlClientRepository extends GetxController {
final db = Get.find<Sqlnitializerrepository>().db;

  static SqlClientRepository get to {
    try {
      return Get.find<SqlClientRepository>();
    } catch (e) {
      return Get.put(SqlClientRepository());
    }
  }

  Future<List<ClientModel>> getAllClients() async {
    final clients = <ClientModel>[];
    final result = await db.query("clients", limit: 50);
    for (final row in result) {
      clients.add(ClientModel(
        id: row['id'] as int,
        name: row['name'] as String,
        age: row['age'] as int,
      ));
    }
    return clients;
  }

  addClient(ClientModel client) async {}


}
