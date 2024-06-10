import 'package:flutter/material.dart';

class profil extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
            color: Colors.brown,
            height: 290,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                      child: IconButton(
                      onPressed: (){
                      Navigator.pop(context);
                      }, 
                  icon: Icon(Icons.arrow_back,
                  size: 30,
                  color: Colors.white,), ),),    
                  ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: 290,
                        child:Row(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Image.asset("assets/images/tanah.png",
                                    fit: BoxFit.cover,),
                                  ),
                                  Center(
                                    child: Text("Pemeliharaan Jembatan Tanah Datar",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                    ),),
                                  )
                                ],
                              ),
                            ),
  
                          ],
                        ), 
                      ),
                    ],
                  ),
                ),
              ],
            ) 
          ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text("Sign Operator",
              style: TextStyle(
                fontWeight: FontWeight.w500
              ),),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                children: [
                  Text("Admin"),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400
                    ),
                    child: Center(
                      child: Text("Faiz Rendang"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child:TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, "/login");
                          }, 
                          child: Text("Switch Acount",
                          style: TextStyle(
                            color: Colors.white,
                          ),)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade400,
                          ),
                          child:TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, "/");
                          }, 
                          child: Text("Logout",
                          style: TextStyle(
                            color: Colors.black,
                          ),)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
    );
  }
}