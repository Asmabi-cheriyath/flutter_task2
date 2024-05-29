import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task2/views/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream? userstream;
  getonload() async {
    userstream = await Databasedetails().getuser();
    setState(() {});
  }

  @override
  void initState() {
    getonload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "HOME PAGE",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream: userstream,
            builder: (context, snapshot) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(ds["Username"]),
                              Text(ds["Date of birth"]),
                              Text(ds["Email"]),
                            ],
                          ),
                          IconButton(
                              onPressed: () async {
                                await Databasedetails().removeuser(ds["id"]);
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data.docs.length);
            }),
      ),
    );
  }
}
