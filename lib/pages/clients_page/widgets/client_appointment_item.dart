import 'package:appointments/entities/appointments/controllers/appointments_controller.dart';
import 'package:appointments/utils/colors.dart';
import 'package:appointments/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../entities/appointments/appointmentsModel.dart';

class ClientAppointmentItem extends GetView<AppointmentsController> {
  const ClientAppointmentItem(this.appointment, {super.key});

  final Appointmentsmodel appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gunMetal),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                    'Fecha: ${Jiffy.parse(appointment.date.toIso8601String()).yMMMMEEEEdjm}', softWrap: true,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gunMetal
                ),),
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.pencil),
                onPressed: () {
                  controller.selectedAppointment.value = appointment;
                  Get.toNamed(Routes.editAppointment);
                },
              )
            ],
          ),
          const Divider(
            color: AppColors.gunMetal,
          ),
          Text('Tratamiento: ${appointment.treatment ?? "Aún sin asignar"}'),
          Text('Observaciones: ${appointment.observation ?? "Ninguna"}'),
        ],
      ),
    );
  }
}
