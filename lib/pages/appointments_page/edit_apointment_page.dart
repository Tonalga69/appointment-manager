import 'package:appointments/entities/appointments/controllers/appointments_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAppointmentPage extends GetView<AppointmentsController> {
  const EditAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver cita'),
      ),
    );
  }
}
