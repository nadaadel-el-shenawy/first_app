import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/home_screen.dart';
import 'package:first_app/veiws/scr/forget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "LoginScreen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                      controller: emailController,
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
                      controller: passwordController,
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
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString(
                                'email', emailController.text);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home_Screen()));
                            if (formKey.currentState!.validate()) {
                              bool result = await fireBaselogin(
                                  emailController.text,
                                  passwordController.text);
                              if (result == true) {
                                fireBaselogin(emailController.text,
                                    passwordController.text);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('login faild')),
                                );
                              }
                              // Validated successfully, perform login action
                              // You can access the email and password using _emailController.text and _passwordController.text
                              print('Validation successful!');
                              // Replace with your action
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

  Future<bool> fireBaselogin(String email, String password) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}
