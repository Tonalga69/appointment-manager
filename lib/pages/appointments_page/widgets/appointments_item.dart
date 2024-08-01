

import 'package:appointments/entities/appointments/controllers/appointments_controller.dart';
import 'package:appointments/utils/colors.dart';
import 'package:appointments/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../entities/appointments/appointmentsModel.dart';

class AppointmentsItem extends GetView<AppointmentsController> {
  const AppointmentsItem({super.key, required this.appointment});
  final Appointmentsmodel appointment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        controller.selectedAppointment.value = appointment;
        Get.toNamed(Routes.editAppointment);
      },
      leading: const Icon(Icons.calendar_today, color: AppColors.blue,),
      title: Text(appointment.client.target?.name ?? 'Usuario eliminado'),
      subtitle: FutureBuilder(
        future: Jiffy.setLocale("es"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text(Jiffy.parse(appointment.date.toIso8601String()).yMMMMEEEEdjm);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
