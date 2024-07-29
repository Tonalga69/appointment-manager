import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/entities/clients/respositories/SqlClientRepository.dart';
import 'package:get/get.dart';

class ClientsController extends GetxController {
  final clientsList = <ClientModel>[].obs;
  var selectedClient = Rxn<ClientModel>(null);
  static ClientsController get to {
    try {
      return Get.find<ClientsController>();
    } catch (e) {
      return Get.put(ClientsController());
    }
  }

  void getAllClients() async {
    clientsList.value = await ClientsRepository.to.getAllClients();
  }

  void addClient(ClientModel client) async {
    final res = await ClientsRepository.to.addClient(client);
    if (!res) {
      Get.snackbar('Error', 'No se pudo agregar el cliente');
      return;
    }
    clientsList.add(client);
    Get.back();
    Get.snackbar('Exito', 'Cliente agregado correctamente');
  }


}
