import 'package:first_app/home_screen.dart';
import 'package:first_app/scr/forget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "LoginScreen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  final formKey= GlobalKey<FormState>();
TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                      child: CircleAvatar(
                        radius: 150.0,
                        backgroundImage: NetworkImage(
                            'https://t3.ftcdn.net/jpg/02/20/63/46/240_F_220634687_e0KD41YbbQzyo9XN9UQmyI4tXD6ze5N8.jpg'),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "email",
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.orange,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 3.0,
                            )),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                          return "Enter correct Email Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "passward",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.orange,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 3.0,
                            )),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return "Password must be at least 8 characters long";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const forget()));
                            },
                            child: const Text(
                              "forget the password?",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 20),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: MaterialButton(
                          elevation: 10.0,
                          color: Colors.orange,
                          onPressed: () async {
                            
                            final SharedPreferences prefs =await SharedPreferences.getInstance();
                            await prefs.setString('email', emailController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home_Screen()));
                            if (formkey.currentState!.validate()) {
                              // Validated successfully, perform login action
                              // You can access the email and password using _emailController.text and _passwordController.text
                              print(
                                  'Validation successful!'); // Replace with your action
                            }
                          },
                          child: const Text(
                            'login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?',
                              style: TextStyle(fontSize: 20.0)),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.orange,
                              ),
                              child: const Text(
                                'Register Now',
                                style: TextStyle(fontSize: 20.0),
                              ))
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
