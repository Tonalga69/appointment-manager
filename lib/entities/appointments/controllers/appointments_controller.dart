import 'package:appointments/entities/appointments/appointmentsModel.dart';
import 'package:appointments/entities/appointments/repositories/appointment_repository.dart';
import 'package:appointments/entities/clients/respositories/clients_repository.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class AppointmentsController extends GetxController {
  Appointmentsmodel? appointment;
  final clients = DropListModel([]).obs;
  final selectedClient =
      Rx<OptionItem>(OptionItem(title: 'Seleccione un cliente', id: '-1'));
  final appointments = <Appointmentsmodel>[].obs;
  final selectedAppointment = Rxn<Appointmentsmodel>(null);

  AppointmentsController get to {
    try {
      return Get.find<AppointmentsController>();
    } catch (e) {
      return Get.put(AppointmentsController());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllClients();
    getAllAppointments();
  }

  Future<void> getAllAppointments() async {
    appointments.value = await AppointmentRepository.to.getAllAppointments();
  }

  void getAllClients() async {
    clients.value = DropListModel((await ClientsRepository().getAllClients())
        .map((e) => OptionItem(title: e.name, id: e.id.toString()))
        .toList());
  }

  final dateController = TextEditingController();

  final clientController = TextEditingController();

  void addAppointment() {
    if (appointment == null) {
      return;
    }

    try {
      appointment!.client.target = ClientsRepository.to
          .getClientById(int.parse(selectedClient.value.id!))!;
      AppointmentRepository.to.addAppointment(appointment!);
      appointments.add(appointment!);
      clearFields();
      Get.back();
    } catch (e) {
      Get.snackbar('Error', 'No se pudo guardar la cita');
    }
  }

  void clearFields() {
    appointment = null;
    dateController.clear();
    clientController.clear();
    selectedClient.value = OptionItem(title: 'Seleccione un cliente', id: '-1');
  }

  void selectDate(BuildContext context) {
    appointment = Appointmentsmodel(date: DateTime.now());
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((value) {
      dateController.text = value.toString().split(' ')[0];
      appointment!.date = value!;
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      ).then((value) {
        appointment!.date = DateTime(
          appointment!.date.year,
          appointment!.date.month,
          appointment!.date.day,
          value!.hour,
          value.minute,
        );
        Jiffy.setLocale("es").then((value){
          dateController.text = Jiffy.parse(appointment!.date.toIso8601String()).yMMMMEEEEdjm;
        });

      });
    });
  }
}
