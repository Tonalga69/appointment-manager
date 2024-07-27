import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/entities/clients/respositories/SqlClientRepository.dart';
import 'package:get/get.dart';

class ClientsController extends GetxController {
  final clientsList = <ClientModel>[].obs;
  var selectedClient = Rxn<ClientModel>(null);

  void getAllClients() async {
    clientsList.value = await SqlClientRepository.to.getAllClients();
  }

  void addClient(ClientModel client) async {
    await SqlClientRepository.to.addClient(client);
    getAllClients();
  }

  @override
  void onReady() {
    getAllClients();
    super.onReady();
  }
}
