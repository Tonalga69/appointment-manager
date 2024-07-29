import 'package:appointments/entities/clients/Model.dart';
import 'package:get/get.dart';

class ClientsRepository extends GetxController {
  static ClientsRepository get to {
    try {
      return Get.find<ClientsRepository>();
    } catch (e) {
      return Get.put(ClientsRepository());
    }
  }

  Future<List<ClientModel>> getAllClients() async {
    final clients = <ClientModel>[];
    return clients;
  }

  Future<bool> addClient(ClientModel client) async {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }
}
