import 'package:appointments/entities/appointments/repositories/appointment_repository.dart';
import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/entities/clients/respositories/clients_repository.dart';
import 'package:appointments/utils/routes.dart';
import 'package:get/get.dart';

import '../../appointments/appointmentsModel.dart';
import '../../appointments/controllers/appointments_controller.dart';

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
    if (res==null) {
      Get.snackbar('Error', 'No se pudo agregar el cliente');
      return;
    }
    clientsList.add(res);
    AppointmentsController.to.getAllClients();
    Get.offAllNamed(Routes.HOME);
    Get.snackbar('Exito', 'Cliente agregado correctamente');
  }

  void requestUpdateSelectedClient(){
    selectedClient.value = ClientsRepository.to.getClientById(selectedClient.value!.id);
    clientsList[clientsList.indexWhere((element) => element.id == selectedClient.value!.id)] = selectedClient.value!;
  }

  void deleteSelectedClient() async {
     _requestDeleteAppointmentsFromDeletedUser(selectedClient.value!);
    final res = await ClientsRepository.to.deleteClient(selectedClient.value!.id);
    if (!res) {
      Get.snackbar('Error', 'No se pudo eliminar el cliente');
      return;
    }
    clientsList.removeWhere((element) => element.id == selectedClient.value!.id);
    Get.offAllNamed(Routes.HOME);
    selectedClient.value = null;
    AppointmentsController.to.getAllClients();
    AppointmentsController.to.getAllAppointments();

    Get.snackbar('Exito', 'Cliente eliminado correctamente');
  }

   void _requestDeleteAppointmentsFromDeletedUser(ClientModel model) {
    for (var element in model.appointments) {
       AppointmentRepository.to.deleteAppointment(element);
    }
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
    AppointmentsController.to.getAllClients();
    Get.back();
    Get.snackbar('Exito', 'Cliente actualizado correctamente');
  }
}
