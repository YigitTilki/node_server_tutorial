import 'package:flutter/material.dart';
import 'package:node_server_tutorial/services/api.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(hintText: "Price"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(hintText: "Desc"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                var data = {
                  "pName": nameController.text,
                  "pPrice": priceController.text,
                  "pDesc": descController.text,
                };
                Api.addProduct(data);
              },
              child: const Text("Create Data"),
            ),
          ],
        ),
      ),
    );
  }
}
