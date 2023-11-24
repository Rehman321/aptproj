import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  signInWithEmailAndPassword()async{
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
      );
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No user found for that email.."),
            ),
        );
      } else if (e.code == 'wrong-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Wrong Password Provided For That User."),
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: OverflowBar(
              overflowSpacing: 30,
              children: [
                TextFormField(
                  controller: _email,
                  validator: (text){
                    if(text == null || text.isEmpty){
                      return "Email is empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  controller: _password,
                  validator: (text){
                    if(text == null || text.isEmpty){
                      return "Password is empty";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: "Password"),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: (){
                        if(_formkey.currentState!.validate()){
                          signInWithEmailAndPassword();
                        }
                    },
                    child:isLoading
                        ? Center(child: const CircularProgressIndicator(color: Colors.white,))
                        : const Text("Login"),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formkey.currentState!.validate()){
                        signInWithEmailAndPassword();
                      }
                    },
                    child: const Text("SignUp"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
