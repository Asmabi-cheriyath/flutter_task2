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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  // fillColor: Colors.grey,
                  // filled: true,
                  labelText: "Username",
                  hintText: "Enter your Username",
                  hintStyle: TextStyle(fontStyle: FontStyle.italic),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.verified_user_outlined),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: "Password",
                    hintText: "Enter your Password",
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                    )),
              ),
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
