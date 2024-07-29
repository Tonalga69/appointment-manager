import 'package:appointments/entities/clients/controllers/ClientsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsPager extends GetView<ClientsController> {
  const ClientsPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => ListView.builder(
            itemCount: controller.clientsList.length,
            itemBuilder: (context, index) {
              final client = controller.clientsList[index];
              return ListTile(
                title: Text(client.name),
                subtitle: Text(client.age.toString()),
              );
            },
          )),
    );
  }
}
