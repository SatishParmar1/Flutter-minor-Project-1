import 'package:flutter/material.dart';

import 'package:hello_satish/geo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:hello_satish/geo.dart';


class Second extends StatefulWidget {
  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  void login() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>getLocation()),
      );
  }
  void signuptop() {
  }

  @override

  void initState() {
    super.initState();
    Firebase.initializeApp();

  }
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();




  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body:DecoratedBox(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/back.png"),
    fit: BoxFit.fill,
    opacity: 0.25 ),

    ),
       child:
       SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:const EdgeInsets.all(15.0),
              child: Center(
                child: Container(
                  height: 350, // Reduced height
                  width: 400,
                  margin:const EdgeInsets.fromLTRB(0, 130, 0, 0),
                  decoration: const BoxDecoration(

                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [

                      Column(

                        children: [

                          Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 300,

                              child: const Text("Welcome,", style: TextStyle(fontSize: 30),),
                            ),
                          ),
                          Padding(padding:const  EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Container(
                              height: 40,
                              width: 300,
                              child: const Text("Back", style: TextStyle(fontSize: 30),),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Padding(padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child:  TextField(
                          controller: _email,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              hintText: ("Enter your Email") ,
                              hintStyle: TextStyle(fontSize:20),
                              hoverColor: Colors.black,
                              suffixIcon: Icon(Icons.person),

                              suffixIconColor: Colors.black,
                              contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 0)

                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child:  TextField(
                          controller: _password,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              hintText: ("Enter your Password") ,
                              hintStyle: TextStyle(fontSize:20),
                              hoverColor: Colors.black,
                              suffixIcon: Icon(Icons.lock_open),

                              suffixIconColor: Colors.black,
                              contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 0)

                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(45, 0, 30, 0),
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: const BoxDecoration(
                                color:Colors.white,

                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child:   ElevatedButton(style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                              ),onPressed: (){
                                signuptop();

                              }, child:
                              const  Text("Signup",style: TextStyle(fontSize: 27,color: Colors.black),),
                              ),

                            ),
                          ),
                          Padding(padding:const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: const BoxDecoration(
                                color:Colors.white,

                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child:   ElevatedButton(style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                              ),onPressed: (){
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _email.text, password: _password.text).then((value){Navigator.push(context,MaterialPageRoute(builder: (context) => getLocation()));}).onError((error, stackTrace){print(error);});},

                               child:
                              const Text("Log in",style: TextStyle(fontSize: 27,color: Colors.black),),
                              ),

                            ),
                          ),

                        ],
                      )
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
