import 'package:appointments/entities/appointments/controllers/appointments_controller.dart';
import 'package:appointments/utils/colors.dart';
import 'package:appointments/utils/styles/input_form_styles.dart';
import 'package:dropdown_model_list/drop_down/search_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAppointmentPage extends GetView<AppointmentsController> {
   NewAppointmentPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon:  const Icon(Icons.arrow_back, color: AppColors.white,),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: AppColors.blue,
        title: const Text('Nueva cita', style: TextStyle(fontSize: 18, color: AppColors.white)),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Obx(
              () =>  SearchDropList(
                itemSelected: controller.selectedClient.value,
                dropListModel: controller.clients.value,
                showIcon: false,
                showArrowIcon: true,
                showBorder: true,
                enable: true,
                textEditingController: controller.clientController,
                paddingTop: 0,
                suffixIcon: Icons.arrow_drop_down,
                containerPadding: const EdgeInsets.all(10),
                icon: const Icon(Icons.person, color: Colors.black),
                onOptionSelected: (optionItem) {
                  controller.selectedClient.value = optionItem;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la fecha';
                  }
                  return null;
                },
                style: labelStyleGunMetal,
                controller: controller.dateController,
                decoration:  InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_today),
                  ),
                  labelText: 'Fecha',
                  labelStyle: labelStyleGunMetal,
                  border: outlineInputBorderGunMetal,
                  enabledBorder: outlineInputBorderGunMetal,
                  focusedBorder: outlineInputBorderGunMetal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (!formKey.currentState!.validate()){
                  return;
                }
                if(controller.selectedClient.value.id == "-1"){
                  Get.snackbar('Error', 'Por favor seleccione un cliente');
                  return;
                }
                controller.addAppointment();
              },
              child: const Text('Guardar',
                  style: TextStyle(color: AppColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
