import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobileproject/text.form.dart';
import 'package:mobileproject/auth_service.dart';
import 'package:mobileproject/data.dart';
import 'package:mobileproject/helpers.dart';
import 'package:mobileproject/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController photoController  = TextEditingController();
  final TextEditingController niveauController = TextEditingController();
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth instance = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: const Text("IT SHARE",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 50),
                const Text("Créer votre Compte",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 15,
                ),
                TextFormD(
                  controller: nameController,
                  textF: 'nom Utilisateur',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormD(
                  controller: emailController,
                  textF: 'email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextFormD(
                  controller: passwordController,
                  textF: 'mot de passe',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormD(
                  controller: niveauController,
                  textF: 'niveau scolaire',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormD(
                  controller: photoController,
                  textF: 'photo',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    try {
                      User user = (await instance.createUserWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim()))
                          .user!;
                      setState(() {});
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Login()));
                      if (user != null) {
                        await DatabaseService(uid: user.uid).savingUserData(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            photoController.text.trim(),
                            niveauController.text.trim(),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        // code
                      } else if (e.code == 'email-already-in-use') {
                        //code
                      }
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            ),
                          ]),
                      child: const Text(
                        'Créer un compte ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      )),
    );
  }
  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(nameController.text.trim(), emailController.text.trim(), passwordController.text.trim(),photoController.text.trim(),niveauController.text.trim())
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(emailController.text.trim());
          await HelperFunctions.saveUserNameSF(nameController.text.trim());
          await HelperFunctions.saveUserPhotoSF(photoController.text.trim());
          await HelperFunctions.saveUserPhotoSF(niveauController.text.trim());
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Login()));
        } else {
          //showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
