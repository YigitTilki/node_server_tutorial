import 'package:flutter/material.dart';
import 'package:node_server_tutorial/create.dart';
import 'package:node_server_tutorial/delete.dart';
import 'package:node_server_tutorial/fetch.dart';
import 'package:node_server_tutorial/update.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CreateData(),
                  ),
                );
              },
              child: const Text("Create"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const FetchData(),
                  ),
                );
              },
              child: const Text("Read"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UpdateScreen(),
                  ),
                );
              },
              child: const Text("Update"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DeleteScreen(),
                  ),
                );
              },
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
