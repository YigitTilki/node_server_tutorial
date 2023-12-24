import 'package:flutter/material.dart';
import 'package:node_server_tutorial/model/product_model.dart';
import 'package:node_server_tutorial/services/api.dart';

class EditScreen extends StatefulWidget {
  final Product data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descController.text = widget.data.desc.toString();
  }

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
                Api.updateProduct(widget.data.id, {
                  "pName": nameController.text,
                  "pPrice": priceController.text,
                  "pDesc": descController.text,
                  "id": widget.data.id
                });
              },
              child: const Text("Update Data"),
            ),
          ],
        ),
      ),
    );
  }
}
