import 'package:appointments/entities/appointments/repositories/appointment_repository.dart';
import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/entities/clients/respositories/clients_repository.dart';
import 'package:get/get.dart';

import '../../appointments/appointmentsModel.dart';

class ClientsController extends GetxController {
  final clientsList = <ClientModel>[].obs;
  final selectedClient = Rxn<ClientModel>(null);
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

  Future<List<Appointmentsmodel>> getAllAppointmentsFromSelectedClient() async {
    return await AppointmentRepository.to.getAllAppointments();
  }

  void getAllClients({String? name}) async {
    if (name != null) {
      clientsList.value = ClientsRepository.to.getClientByName(name);
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

  void requestUpdateSelectedClient(){
    selectedClient.value = ClientsRepository.to.getClientById(selectedClient.value!.id);
    clientsList[clientsList.indexWhere((element) => element.id == selectedClient.value!.id)] = selectedClient.value!;
  }

  void updateClient(ClientModel client) async {
    final res = await ClientsRepository.to.updateClient(client);
    if (res == null) {
      Get.snackbar('Error', 'No se pudo actualizar el cliente');
      return;
    }
    final index = clientsList.indexWhere((element) => element.id == res.id);
    clientsList[index] = res;
    selectedClient.value = res;
    Get.back();
    Get.snackbar('Exito', 'Cliente actualizado correctamente');
  }
}
