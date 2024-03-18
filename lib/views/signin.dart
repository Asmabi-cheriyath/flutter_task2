import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task2/views/loginscreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> signkey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController dateofbirthcontroller = TextEditingController();

  String selectedgender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: signkey,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Name";
                      }
                      return null;
                    },
                    // (username)=>username!.length<3? "name should be at least 3 character":null,

                    controller: usernamecontroller,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: "Username",
                        prefixIcon: Icon(Icons.person)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(onTap: () {
                    showDatePicker(context: context, firstDate: DateTime(1850), lastDate: DateTime.now());
                  },
                    controller: dateofbirthcontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: "Date of Birth"),
                  ),

                ),
                RadioListTile(
                  title: const Text("male"),
                  value: "male",
                  groupValue: selectedgender,
                  onChanged: (value) {
                    setState(() {
                      selectedgender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("female"),
                  value: "female",
                  groupValue: selectedgender,
                  onChanged: (value) {
                    setState(() {
                      selectedgender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("others"),
                  value: "others",
                  groupValue: selectedgender,
                  onChanged: (value) {
                    setState(() {
                      selectedgender = value.toString();
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter the email";
                      }
                      bool isValied =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value);
                      if (!isValied) {
                        return "email is not valied";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email)),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "password required";
                      } else {
                        return null;
                      }
                    },
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
                    controller: confirmpasswordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "confirm password";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.key)),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      print(selectedgender);
                      if (signkey.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Sign Up")),
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
      ),
    );
  }
}



// {
//                         if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value));
//                       }
