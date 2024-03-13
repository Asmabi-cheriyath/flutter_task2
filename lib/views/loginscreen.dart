import 'package:flutter/material.dart';
import 'package:flutter_task2/views/homepage.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginkey = GlobalKey<FormState>();
    TextEditingController usernamecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    void login(String username, double password) {
      if (username == "asma" && password == 123) {
        print("correct");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print("invalied usename and password");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("INCORRECT USERNAME AND PASSWORD"),
        ));
      }
    }

    return Scaffold(
        body: Center(
            child: Form(
      key: loginkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required fields";
                } else {
                  return null;
                }
              },
              controller: usernamecontroller,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                // enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.black)),
                // focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey)),
                // fillColor: Colors.grey,
                // filled: true,
                labelText: "Username",
                // hintText: "Enter your Username",
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.verified_user_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required field";
                } else {
                  return null;
                }
              },
              controller: passwordcontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  // enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.black)),
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.grey)),
                  //     errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  labelText: "Password",
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                  )),
            ),
          ),

          TextButton(
            onPressed: () {
              if (loginkey.currentState!.validate()) {
                login(usernamecontroller.text,
                    double.parse(passwordcontroller.text));
              }
            },
            child: const Text("LOGIN"),
          )

          // ElevatedButton(
          //     style: const ButtonStyle(
          //         foregroundColor: MaterialStatePropertyAll(Colors.blue),
          //         backgroundColor:
          //             MaterialStatePropertyAll(Colors.deepPurple)),
          //     onPressed: () {},
          //     child: const Text("LOGIN"))

          // OutlinedButton(
          //     style: ButtonStyle(
          //         minimumSize: MaterialStateProperty.all(const Size(30, 30)),
          //         foregroundColor:
          //             const MaterialStatePropertyAll(Colors.black38)),
          //     onPressed: () {},
          //     child: const Text("LOGIN"))
        ],
      ),
    )));
  }
}
