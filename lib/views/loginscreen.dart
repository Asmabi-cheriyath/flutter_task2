import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task2/views/homepage.dart';
import 'package:flutter_task2/views/signin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

GlobalKey<FormState> loginkey = GlobalKey<FormState>();
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

bool obsecuretext = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    void login(String username, String password) {
      if (username == "asma" && password == "123") {
        print("Correct");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        print("Invalied Username and Password");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("INCORRECT USERNAME AND PASSWORD"),
        ));
      }
    }

    return Scaffold(
        body: Form(
      key: loginkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.deepPurple),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required Fields";
                } else {
                  return null;
                }
              },
              controller: emailcontroller,
              // textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                // enabledBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.black)),
                // focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey)),
                // fillColor: Colors.grey,
                // filled: true,
                labelText: "E-mail",
                // hintText: "Enter your Username",
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.deepPurple,
                ),
                suffixIcon: Icon(
                  Icons.verified_user_outlined,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: obsecuretext,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Required Field";
                } else {
                  return null;
                }
              },
              controller: passwordcontroller,
              enabled: true,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Password",
                  prefixIcon: const Icon(
                    Icons.key,
                    color: Colors.deepPurple,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecuretext = !obsecuretext;
                        });
                      },
                      icon: obsecuretext
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined))),
            ),
          ),

          TextButton(
            onPressed: () {
              if (loginkey.currentState!.validate()) {
                login(emailcontroller.text, passwordcontroller.text);
              }
            },
            child: InkWell(
              onTap: () {
                if (loginkey.currentState!.validate()) {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailcontroller.text,
                          password: passwordcontroller.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  });
                }
              },
              child: const Text(
                "LOGIN",
                selectionColor: Colors.amber,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Dont have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text("SignUp"),
              )
            ],
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
    ));
  }
}
