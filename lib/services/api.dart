import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:node_server_tutorial/model/product_model.dart';

class Api {
  static const baseUrl = "http://IPadress/api/";

  static addProduct(Map pData) async {
    if (kDebugMode) {
      print(pData);
    }
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final res = await http.post(url, body: pData);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getProduct() async {
    List<Product> products = [];

    var url = Uri.parse("${baseUrl}get_product");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        data["products"].forEach(
          (value) => {
            products.add(
              Product(
                name: value['pName'],
                price: value['pPrice'],
                desc: value['pDesc'],
                id: value['id'].toString(),
              ),
            ),
          },
        );
        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static updateProduct(id, body) async {
    var url = Uri.parse("${baseUrl}update/$id");

    final res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Failed To Update Data");
    }
  }

  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete/$id");

    try {
      final res = await http.post(url);

      if (res.statusCode == 204) {
        print(jsonDecode(res.body));
      } else {
        print("Failed to Delete");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
