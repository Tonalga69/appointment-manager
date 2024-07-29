import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:appointments/entities/clients/controllers/ClientsController.dart';
import 'package:appointments/pages/clients_page/widgets/client_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsPager extends GetView<ClientsController> {
  const ClientsPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(8.0)),
          AnimSearchBar(
            rtl: true,
            width: 400,
            helpText: "Buscar cliente",
            onSuffixTap: () {
              controller.getAllClients();
              controller.nameSearch.value = '';
            },
            textController: TextEditingController(),
            onSubmitted: (name) {
              controller.nameSearch.value = name;
              controller.getAllClients(name: name);
            },
          ),
          Obx(
            () {
              return controller.nameSearch.value.isEmpty
                  ? const Text('Todos los clientes')
                  : Text('Clientes con el nombre ${controller.nameSearch.value}');
            }
          ),
          Obx(() => Expanded(
                child: ListView.builder(
                  itemCount: controller.clientsList.length,
                  itemBuilder: (context, index) {
                    final client = controller.clientsList[index];
                    return InkWell(
                      onTap: () {},
                      child: ClientItem(client: client),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
