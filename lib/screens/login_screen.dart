import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      controller: emailController,
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your Email";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
      },
      onSaved: (value) {
        emailController.text = value!;
      },
    );
    final passwordField = TextFormField(
      controller: passwordController,
      obscureText: true,
      autofocus: false,
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        RegExp regExp = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter your password");
        }
        if (!regExp.hasMatch(value)) {
          return ("Please Enter valid Password");
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      onSaved: (value) {
        passwordController.text = value!;
      },
    );
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        onPressed: () {
          logIn(emailController.text, passwordController.text);
        },
        child: Text(
          "Ander Jao",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                          "assets/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png"),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    emailField,
                    SizedBox(
                      height: 25,
                    ),
                    passwordField,
                    SizedBox(
                      height: 15,
                    ),
                    loginButton,
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Khata Nahi Ha ? "),
                        GestureDetector(
                            onTap: () {
                              context.push("/signupscreen");
                            },
                            child: Text(
                              "Banwa lo",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void logIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "login Succesfull"),
                  context.go("/home"),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
