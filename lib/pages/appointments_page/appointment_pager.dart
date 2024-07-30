import 'package:appointments/entities/appointments/controllers/appointments_controller.dart';
import 'package:appointments/pages/appointments_page/widgets/appointments_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentPager extends GetView<AppointmentsController> {
  const AppointmentPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.appointments.length,
          itemBuilder: (context, index) {
            final appointment = controller.appointments[index];
            return AppointmentsItem(appointment: appointment);
          },
        ),
      ),
    );
  }
}
