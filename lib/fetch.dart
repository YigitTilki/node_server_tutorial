import 'package:flutter/material.dart';
import 'package:node_server_tutorial/model/product_model.dart';
import 'package:node_server_tutorial/services/api.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  trailing: Text("\$ ${pData[index].price}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
