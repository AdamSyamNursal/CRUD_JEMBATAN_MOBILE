import 'package:flutter/material.dart';
import 'package:jembatan/isi/isi.dart';
import 'package:jembatan/isi/isiope.dart';

class operatorpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.brown.shade600,
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
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/profil");
                            },
                            icon: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: isiop()),
            //Text('Operator: $operatorName'), // Tampilkan operatorName di sini
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/tambahlaporan");
        },
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
