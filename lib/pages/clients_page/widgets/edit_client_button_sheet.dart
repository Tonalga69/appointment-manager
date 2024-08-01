
import 'package:appointments/entities/clients/Model.dart';
import 'package:appointments/entities/clients/controllers/ClientsController.dart';
import 'package:appointments/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditClientButtonSheet extends StatefulWidget {
  const EditClientButtonSheet({super.key, required this.client});

  final ClientModel client;

  @override
  State<EditClientButtonSheet> createState() => _EditClientButtonSheetState();
}

class _EditClientButtonSheetState extends State<EditClientButtonSheet> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final noteBookNumberController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.client.name;
    ageController.text = widget.client.age.toString();
    noteBookNumberController.text = widget.client.noteBookNumber != null
        ? widget.client.noteBookNumber.toString()
        : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El nombre es requerido';
                    }
                    return null;
                  },
                  style: const TextStyle(color: AppColors.gunMetal),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: AppColors.gunMetal),
                      labelText: 'Nombre',
                      hintText: 'Ingrese el nombre del cliente',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.gunMetal),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.blue),
                      )),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                TextFormField(
                  controller: ageController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'La edad es requerida';
                    }
                    return null;
                  },
                  style: const TextStyle(color: AppColors.gunMetal),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      suffixText: 'Años',
                      labelStyle: const TextStyle(color: AppColors.gunMetal),
                      labelText: 'Edad',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.gunMetal),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.blue),
                      ),
                      hintText: 'Ingrese la edad del cliente'),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                TextFormField(
                  controller: noteBookNumberController,
                  style: const TextStyle(color: AppColors.gunMetal),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      suffixText: 'Cuaderno',
                      labelStyle: const TextStyle(color: AppColors.gunMetal),
                      labelText: 'No. cuaderno',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.gunMetal),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.blue),
                      ),
                      hintText: 'cuaderno'),
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
                    if (formKey.currentState!.validate()) {
                      int? noteBookNumber =
                      int.tryParse(noteBookNumberController.text);
                      ClientsController.to.updateClient(ClientModel(
                          id: widget.client.id,
                          name: nameController.text.trim(),
                          noteBookNumber: noteBookNumber,
                          age: int.parse(ageController.text)));
                    }
                  },
                  child: const Text('Guardar',
                      style: TextStyle(color: AppColors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
