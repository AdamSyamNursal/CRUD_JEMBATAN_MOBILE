import 'package:flutter/material.dart';
import 'package:jembatan/isi/isi.dart';

class Homepage extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
            color: Colors.grey.shade600,
            height: 80,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5.0),
                  height: 60,
                  child: Image.asset("assets/images/logo.png"),
                ),
                Container(
                  width: 290,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        child: Column(
                          children: [
                            Image.asset("assets/images/BRITA.png"),
                            SizedBox(
                              height: 5,
                            ),
                            Image.asset("assets/images/BridgeTA.png")
                          ],
                        ),
                      ),
                      Container(
                        child: 
                        IconButton(
                          onPressed: (){
                            Navigator.pushNamed(context, "/login");
                          }, 
                          icon: Icon(Icons.person,
                          size: 40,
                          color: Colors.white,)),
                      )
                    ],
                  ),
                )
              ],
            ) 
          ),
           Expanded(
            child: isi())
          ],
        )),
    );
  }
}