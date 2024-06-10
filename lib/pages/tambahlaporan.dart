import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tambahlaporan extends StatefulWidget {
  @override
  _TambahlaporanState createState() => _TambahlaporanState();
}

class _TambahlaporanState extends State<Tambahlaporan> {
  final TextEditingController catatanController = TextEditingController();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> tambahLaporan() async {
    String catatan = catatanController.text;

    if (catatan.isNotEmpty) {
      final laporan = <String, dynamic>{
        "catatan": catatan,
        "timestamp": FieldValue.serverTimestamp(),
      };

      try {
        await db.collection("laporan").add(laporan);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Laporan berhasil ditambahkan')),
        );
        Navigator.pushNamed(context, "/operator");
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Catatan tidak boleh kosong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
              padding: EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Tambah Laporan",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Center(
                child: Container(
                  height: 60,
                  color: Colors.blue.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning_amber_outlined),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        width: 300,
                        child: Text(
                          "Pastikan Masukan Foto yang diambil di lokasi Kejadian",
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    child: Text("Media(Foto)"),
                  ),
                  Container(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                      ),
                      onPressed: () {},
                      child: Text(
                        "+ Tambah Media",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    child: Text("Catatan"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: catatanController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Masukan Keterangan Jembatan",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tambahLaporan,
        child: Icon(
          Icons.send,
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
