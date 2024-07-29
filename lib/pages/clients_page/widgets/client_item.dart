import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/utils/colors.dart';
import 'package:flutter/material.dart';

class ClientItem extends StatelessWidget {
  const ClientItem({super.key, required this.client});

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gunMetal),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            client.name,
            softWrap: true,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.gunMetal),
          ),
          Text("Edad: ${client.age.toString()} años"),
          Text("Cuaderno: ${client.noteBookNumber ?? 'No asignado'}"),
        ],
      ),
    );
  }
}
