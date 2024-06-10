import 'package:flutter/material.dart';

class register extends StatelessWidget {
  Widget build (BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
              color: Colors.brown,
              height: 80,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, 
                  icon: Icon(Icons.arrow_back,
                  size: 30,
                  color: Colors.white,), )
                ],
              ) 
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child:Center(
                child:Text("REGISTER",
                  style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),),
              )
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
              ),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        Text("Username"),
                        TextField(
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
      floatingActionButton: 
      FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, "/login");
      },
      child: Icon(Icons.login_outlined,
      color: Colors.white,),
      backgroundColor: Colors.brown,
      ),
    );
  }
}