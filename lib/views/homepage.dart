import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "HOME PAGE",
          style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: (index + 1) % 5 == 0 ? Colors.deepPurpleAccent : Colors.lightBlue,
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 50),
      ),
    );
  }
}
