import 'package:flutter/material.dart';
import 'package:flutter_task2/views/loginscreen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.deepPurple),
              ),
              const Text("Create your account"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Username",
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.key)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.key)),
                ),
              ),
              TextButton(onPressed: () {}, child: const Text("Sign Up")),
              const Text("Or"),
              TextButton(
                  onPressed: () {}, child: const Text("Sign In with Google")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Login()));
                      },
                      child: const Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
