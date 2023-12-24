import 'package:flutter/material.dart';
import 'package:node_server_tutorial/edit.dart';
import 'package:node_server_tutorial/model/product_model.dart';
import 'package:node_server_tutorial/services/api.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Operation"),
      ),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> pData = snapshot.data;
            return ListView.builder(
              itemCount: pData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.storage,
                  ),
                  title: Text("${pData[index].name}"),
                  subtitle: Text("${pData[index].desc}"),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditScreen(
                            data: pData[index],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
