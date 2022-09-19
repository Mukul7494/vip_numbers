import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:vip_number_app/model/userModel.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your Email";
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
    );
    final passwordField = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      controller: passwordController,
      validator: (value) {
        RegExp regExp = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter your password");
        }
        if (!regExp.hasMatch(value)) {
          return ("Please Enter valid Password");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
    );
    final confirmPasswordField = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: "Confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      controller: confirmPasswordController,
      validator: ((value) {
        if (confirmPasswordController.text != passwordController.text) {
          return ("Password don't match");
        }
        return null;
      }),
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
    );
    final ageField = TextFormField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.data_thresholding),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: "Age",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      controller: ageController,
      onSaved: (value) {
        ageController.text = value!;
      },
    );
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: Text(
          "Ban Jayega",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.red,
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go('/loginscreen'),
        ),
      ),
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
                        "assets/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png",
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    emailField,
                    SizedBox(
                      height: 25,
                    ),
                    ageField,
                    SizedBox(
                      height: 25,
                    ),
                    passwordField,
                    SizedBox(
                      height: 15,
                    ),
                    confirmPasswordField,
                    SizedBox(
                      height: 15,
                    ),
                    signupButton,
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Khata Ha. "),
                        GestureDetector(
                            onTap: () {
                              context.go("/loginscreen");
                            },
                            child: Text(
                              "login",
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

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((onError) {
        Fluttertoast.showToast(msg: onError!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling firestore
    //calling usermodel
    //sending values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.age = ageController.text;
    // userModel.imageurl = user.imageurl.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");
    context.go("/home");
  }
}
