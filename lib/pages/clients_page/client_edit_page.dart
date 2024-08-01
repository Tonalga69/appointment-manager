import 'package:appointments/entities/clients/controllers/ClientsController.dart';
import 'package:appointments/pages/clients_page/widgets/client_appointment_item.dart';
import 'package:appointments/pages/clients_page/widgets/edit_client_button_sheet.dart';
import 'package:appointments/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class ClientEditPage extends GetView<ClientsController> {
  const ClientEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    assert(controller.selectedClient.value != null);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.pencil, color: AppColors.white),
            onPressed: () {
              Get.bottomSheet(EditClientButtonSheet(
                  client: controller.selectedClient.value!));
            },
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: AppColors.blue,
        title: const Text('Ver cliente',
            style: TextStyle(fontSize: 18, color: AppColors.white)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(8.0)),
                  Obx(() {
                    return Text(controller.selectedClient.value!.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gunMetal));
                  }),
                  Obx(() {
                    return Text(
                        "Edad: ${controller.selectedClient.value?.age.toString()} años");
                  }),
                  Obx(() {
                    return Text(
                        "Cuaderno: ${controller.selectedClient.value?.noteBookNumber ?? 'No asignado'}");
                  }),
                ],
              ),
            ),
          ),
          Obx(
            () => SliverList.builder(
              itemCount:
                  controller.selectedClient.value?.appointments.length ?? 0,
              itemBuilder: (context, index) {
                controller.selectedClient.value?.appointments
                    .sort((a, b) => b.date.compareTo(a.date));
                final appointment =
                    controller.selectedClient.value?.appointments[index];
                return ClientAppointmentItem(appointment!);
              },
            ),
          )
        ],
      ),
    );
  }
}
