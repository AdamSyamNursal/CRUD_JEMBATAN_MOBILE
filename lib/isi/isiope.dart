import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class isiop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('laporan').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No reports found'));
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                Color statusColor = Colors.red; // Mengatur warna awal menjadi merah
                if (data['status'] == 'Sudah Diperbaiki') {
                  statusColor = Colors.green; // Mengubah warna jika status adalah 'Sudah Diperbaiki'
                }
                
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
                                color: statusColor,
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
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () => _editLaporan(context, document.id, data),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => _deleteLaporan(document.id),
                                  ),
                                ],
                              ),
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

  void _editLaporan(BuildContext context, String docId, Map<String, dynamic> data) {
    TextEditingController catatanController = TextEditingController(text: data['catatan']);
    String status = data['status'] ?? 'Rusak';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Laporan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: catatanController,
                decoration: InputDecoration(labelText: 'Catatan'),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: status,
                items: ['Rusak', 'Sudah Diperbaiki'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  status = newValue!;
                },
                decoration: InputDecoration(labelText: 'Status'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('laporan').doc(docId).update({
                  'catatan': catatanController.text,
                  'status': status,
                }).then((_) {
                  Navigator.of(context).pop();
                });
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteLaporan(String docId) {
    FirebaseFirestore.instance.collection('laporan').doc(docId).delete();
  }
}
