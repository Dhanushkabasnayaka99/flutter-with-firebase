//import 'package:login_auth/function/aurthfunction.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_auth/function/Dashboard.dart';
import 'firebase_options.dart';
import 'function/authentication.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

class Login_auth extends StatefulWidget {
  Login_auth({super.key});

  // This widget is the root of your application.
  @override
  _Login_authState createState() => _Login_authState();
}

class _Login_authState extends State<Login_auth> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String passward = "";
  String user_name = "";
  final RegExp passwordPattern =
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        actions: [],
        title: Text("Email/Pass Auth", style: TextStyle()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500.0,
                decoration: BoxDecoration(),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            !isLogin
                                ? TextFormField(
                                    validator: (value) {
                                      if (value.toString().length < 6) {
                                        return "user name is too small";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      setState(() {
                                        user_name = value!;
                                      });
                                    },
                                    key: ValueKey('username'),
                                    decoration: InputDecoration(
                                        hintText: "User name",
                                        labelText: "User name"),
                                  )
                                : Container(),
                            SizedBox(height: 30.0),
                            TextFormField(
                              validator: (value) {
                                if (!(value.toString().contains('@'))) {
                                  return "Email is invalid";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  email = value!;
                                });
                              },
                              key: ValueKey('email'),
                              decoration:
                                  InputDecoration(hintText: "Enter Email"),
                            ),
                            SizedBox(height: 30.0),
                            TextFormField(
                              validator: (value) {
                                if (!(passwordPattern.hasMatch(value!))) {
                                  return "Password must be at least 8 characters, include an uppercase letter, lowercase letter, number, and special character";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  passward = value!;
                                });
                              },
                              obscureText: true,
                              key: ValueKey('password'),
                              decoration:
                                  InputDecoration(hintText: "Enter password"),
                            ),
                            SizedBox(height: 30.0),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    isLogin
                                        ? signin(email, passward)
                                        : (email, passward);
                                  }
                                },
                                child:
                                    !isLogin ? Text("Sign Up") : Text("SignIn"))
                          ],
                        ),
                        SizedBox(height: 20.0),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                                print(isLogin);
                              });
                            },
                            child: !isLogin
                                ? Text("Already have account ,Login")
                                : Text("Don't have account ,SignUp"))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
