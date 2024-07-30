
import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/entities/global_repositories/object_box_repository.dart';
import 'package:get/get.dart';

import '../../../objectbox.g.dart';


class ClientsRepository extends GetxController {
   final store = ObjectBoxRepository.to.store;

  static ClientsRepository get to {
    try {
      return Get.find<ClientsRepository>();
    } catch (e) {
      return Get.put(ClientsRepository());
    }
  }

  List<ClientModel> getClientByName(String query)  {
    return store.box<ClientModel>().query(ClientModel_.name.contains(query)).build().find();
  }

  Future<List<ClientModel>> getAllClients() async {
    return store.box<ClientModel>().getAllAsync();
  }

  Future<bool> addClient(ClientModel client) async {
    try {
      store.box<ClientModel>().put(client);
      return true;
    } catch (e) {
      return false;
    }
  }

  ClientModel? getClientById(int parse) {
    return store.box<ClientModel>().get(parse);
  }

  Future<ClientModel?> updateClient(ClientModel client) async  {
    try {
      final res =await store.box<ClientModel>().putAndGetAsync(client, mode: PutMode.put);
      return res;
    } catch (e) {
      return null;
    }
  }
}
