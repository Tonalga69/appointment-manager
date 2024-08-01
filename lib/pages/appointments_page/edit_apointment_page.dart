import 'package:appointments/entities/appointments/controllers/appointments_controller.dart';
import 'package:appointments/utils/colors.dart';
import 'package:appointments/utils/styles/input_form_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class EditAppointmentPage extends GetView<AppointmentsController> {
  const EditAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.dateController.text = Jiffy.parse(
            controller.selectedAppointment.value!.date.toIso8601String())
        .yMMMMEEEEdjm;
    controller.treatmentController.text =
        controller.selectedAppointment.value!.treatment ?? 'Sin tratamiento';
    controller.observationController.text =
        controller.selectedAppointment.value!.observation ?? 'Sin observación';
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon:
                const Icon(FontAwesomeIcons.floppyDisk, color: AppColors.white),
            onPressed: () {
              final appointment = controller.selectedAppointment.value!;
              appointment.treatment = controller.treatmentController.text;
              appointment.observation = controller.observationController.text;
              controller.updateAppointment(appointment);
              Get.back();
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: AppColors.blue,
        title: const Text(
          'Ver cita',
          style: TextStyle(fontSize: 18, color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Cliente: ${controller.selectedAppointment.value!.client.target?.name?? 'Usuario eliminado'}',
                style: const TextStyle(
                  color: AppColors.gunMetal,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.dateController,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    FontAwesomeIcons.calendar,
                    color: AppColors.blue,
                  ),
                  labelStyle: labelStyleGunMetal,
                  labelText: 'Fecha',
                  hintText: 'Seleccione una fecha',
                  border: outlineInputBorderBlue,
                  focusedBorder: outlineInputBorderGunMetal,
                  enabledBorder: outlineInputBorderGunMetal,
                ),
                onTap: () async {
                  var date = await showDatePicker(
                    context: Get.overlayContext!,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  final time = await showTimePicker(
                    context: Get.overlayContext!,
                    initialTime: TimeOfDay.now(),
                  );
                  if (date == null || time == null) {
                    return;
                  }
                  date = date.add(
                      Duration(hours: time.hour, minutes: time.minute));

                  controller.dateController.text =
                      Jiffy.parse(date.toIso8601String()).yMMMMEEEEdjm;
                  controller.selectedAppointment.value!.date = date;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.treatmentController,
                decoration: InputDecoration(
                  labelStyle: labelStyleGunMetal,
                  labelText: 'Tratamiento',
                  hintText: 'Ingrese el tratamiento',
                  border: outlineInputBorderBlue,
                  focusedBorder: outlineInputBorderGunMetal,
                  enabledBorder: outlineInputBorderGunMetal,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: TextField(
                  minLines: 3,
                  maxLines: 10,
                  controller: controller.observationController,
                  decoration: InputDecoration(
                    labelStyle: labelStyleGunMetal,
                    labelText: 'Observación',
                    hintText: 'Ingrese la observación',
                    border: outlineInputBorderBlue,
                    focusedBorder: outlineInputBorderGunMetal,
                    enabledBorder: outlineInputBorderGunMetal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Eliminar cita'),
                        content:
                            const Text('¿Está seguro de eliminar la cita?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Cancelar',
                                style: TextStyle(
                                  color: AppColors.blue,
                                )),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.red,
                            ),
                            onPressed: () {
                              controller.deleteSelectedAppointment();

                            },
                            child: const Text('Eliminar cita',
                                style: TextStyle(
                                  color: AppColors.white,
                                )),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  side: const BorderSide(color: AppColors.red),
                ),
                child: const Text(
                  'Eliminar cita',
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
