import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _LoginPageState();
}

class _LoginPageState extends State<login> {
  var db = FirebaseFirestore.instance;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;

    try {
      QuerySnapshot querySnapshot = await db
          .collection('user')
          .where('nama', isEqualTo: username)
          .where('pass', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Navigator.pushNamed(context, "/operator");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.brown,
                height: 80,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 500,
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Text("Username"),
                          TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Username",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Text("Password"),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          login(context);
        },
        child: Icon(
          Icons.login_outlined,
          color: Colors.white,
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}

class OperatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Operator Page')),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Register Page')),
    );
  }
}
