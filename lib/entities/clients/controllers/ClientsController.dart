import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/entities/clients/respositories/clients_repository.dart';
import 'package:get/get.dart';

class ClientsController extends GetxController {
  final clientsList = <ClientModel>[].obs;
  var selectedClient = Rxn<ClientModel>(null);
  final nameSearch = ''.obs;
  static ClientsController get to {
    try {
      return Get.find<ClientsController>();
    } catch (e) {
      return Get.put(ClientsController());
    }
  }

  @override
  void onInit() {
    getAllClients();
    super.onInit();
  }

  void getAllClients({String? name}) async {
    if (name != null) {
      clientsList.value =  ClientsRepository.to.getClientByName(name);
      return;
    }
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
