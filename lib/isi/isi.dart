import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class isi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('laporan').snapshots(),
          builder: (context, snapshot) {

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No reports found'));
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              child: Image.network(
                                "https://pupr.ngawikab.go.id/assets/uploads/2022/11/jembatan-ngunengan.jpeg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 50),
                            Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                color: data['status'] == 'Sudah Diperbaiki' ? Colors.green : Colors.red,
                              ),
                              child: Center(
                                child: Text(
                                  data['status'] ?? 'Rusak',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data['catatan'] ?? 'No description'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
