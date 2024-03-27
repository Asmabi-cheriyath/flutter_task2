import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_task2/views/loginscreen.dart';
import 'package:intl/intl.dart';

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
  TextEditingController timecontroller = TextEditingController();

  String selectedgender = "";
  String passwordsss = '';
  bool ischecked = false;

  List<String> items = [
    'Alappuzha',
    'Ernakulam',
    'Idukki',
    'Kannur',
    'Kasaragod',
    'Kollam',
    'Kottayam',
    'Kozhikode',
    'Malappuram',
    'Palakkad',
    'Pathanamthitta',
    'Thiruvanaathapuram',
    'Thrissur',
    'Wayanad'
  ];
  String? selectitems = 'Alappuzha';

  // List dropDownListData= ['Alappuzha','Ernakulam','Idukki','Kannur','Kasaragod','Kollam','Kottayam','Kozhikode','Malappuram','Palakkad','Pathanamthitta','Thiruvanaathapuram','Thrissur','Wayanad'];

  Future<void> selectdate(context) async {
    final DateTime? pickdate = await showDatePicker(
        context: context, firstDate: DateTime(1850), lastDate: DateTime.now());
    if (pickdate != null) {
      String formatedate = DateFormat("dd-MMM-yyyy").format(pickdate);
      setState(() {
        dateofbirthcontroller.text = formatedate;
      });
    }
  }

  Future<void> selecttime(context) async {
    final TimeOfDay? picktime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picktime != null) {
      String formattime = picktime.format(context);
      setState(() {
        timecontroller.text = formattime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Row(
        children: [
          Text("SIGNUP"),
        ],
      )),

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
                    onTap: () {
                      signkey.currentState!.validate();
                    },
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
                  child: TextFormField(
                    onTap: () {
                      selectdate(context);
                      signkey.currentState!.validate();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your birth";
                      } else {
                        return null;
                      }
                    },
                    controller: dateofbirthcontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: "Date of Birth",
                        prefixIcon: Icon(Icons.calendar_month)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTap: () {
                      selecttime(context);
                      signkey.currentState!.validate();
                    },
                    controller: timecontroller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: "Time"),
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

                SizedBox(width: 450,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(width: 3,color: Colors.blue))),
                      value: selectitems,
                      items: items
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ))
                          .toList(),
                      onChanged: (item) => 
                        setState(() {
                          selectitems=item;
                        }),
                        
                      ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTap: () {
                      signkey.currentState!.validate();
                    },
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
                    onTap: () {
                      signkey.currentState!.validate();
                    },
                    obscureText: true,
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter Your Password";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 character";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        passwordsss = value;
                      });
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
                    onTap: () {
                      signkey.currentState!.validate();
                    },
                    obscureText: true,
                    controller: confirmpasswordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password";
                      }
                      if (value != passwordsss) {
                        return "Password do not match";
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
                Row(
                  children: [
                    Checkbox(
                        value: ischecked,
                        onChanged: (value) {
                          setState(() {
                            ischecked = value!;
                          });
                        }),
                    const Text(
                      "I agree these terms and condition",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            ischecked == false ? Colors.grey : Colors.red)),
                    onPressed: () {
                      if (signkey.currentState!.validate()) {
                        ischecked == false
                            ? ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                content:
                                    Text("please agree terms and condition"),
                              ))
                            : Navigator.of(context).pop();
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
