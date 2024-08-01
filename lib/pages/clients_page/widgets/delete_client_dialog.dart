import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/entities/clients/controllers/ClientsController.dart';
import 'package:appointments/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteClientDialog extends GetView<ClientsController> {
  const DeleteClientDialog({super.key, required this.client});
  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Eliminar cliente'),
      content: Text('¿Estás seguro de que deseas eliminar a ${client.name}?\nEsta acción también eliminará las citas asociadas.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar', style: TextStyle(color: AppColors.blue)),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.red,
          ),
          onPressed: () {
            controller.deleteSelectedClient();
          },
          child: const Text('Eliminar', style: TextStyle(color: AppColors.white)),
        ),
      ],
    );
  }
}
