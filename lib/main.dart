import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "login page",
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "Enter your Username",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: "Password", hintText: "Enter your Password"),
            ),

            // TextButton(onPressed: () {}, child: const Text("LOGIN"))

            // ElevatedButton(
            //     style: const ButtonStyle(
            //         foregroundColor: MaterialStatePropertyAll(Colors.blue),
            //         backgroundColor:
            //             MaterialStatePropertyAll(Colors.deepPurple)),
            //     onPressed: () {},
            //     child: const Text("LOGIN"))

            OutlinedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(30, 30)),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black38)),
                onPressed: () {},
                child: const Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}
