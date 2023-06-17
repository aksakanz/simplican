import 'package:flutter/material.dart';
import 'package:simplican/main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StaffManagementDetail extends StatefulWidget {
  final Map ListData;
  const StaffManagementDetail({
    super.key,
    required this.ListData,
  });

  @override
  State<StaffManagementDetail> createState() => _StaffManagementDetailState();
}

class _StaffManagementDetailState extends State<StaffManagementDetail> {
  bool _showHidePassword = true;
  TextEditingController id = new TextEditingController();
  TextEditingController nim = new TextEditingController();
  TextEditingController nama = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future _update() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2/android/updateStaff.php"), body: {
      "id": id.text,
      "nim": nim.text,
      "nama": nama.text,
      "alamat": alamat.text,
      "password": password.text,
    });
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  void _resetForm() {
    nim.clear();
    nama.clear();
    alamat.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    id.text = widget.ListData['id'];
    nim.text = widget.ListData['nim'];
    nama.text = widget.ListData['nama'];
    alamat.text = widget.ListData['alamat'];
    password.text = widget.ListData['password'];
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("Edit Data - "),
              Text(widget.ListData['nama']),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                _resetForm();
              },
              icon: Icon(Icons.restore),
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: nim,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      label: Text("Username"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: nama,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      label: Text("Nama"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    maxLines: 5,
                    controller: alamat,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      label: Text("Alamat"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: password,
                    obscureText: _showHidePassword,
                    onTap: () {
                      setState(() {
                        _showHidePassword = !_showHidePassword;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      label: Text("Kata Sandi"),
                      suffixIcon: Icon(
                        _showHidePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
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
              margin: EdgeInsets.all(30),
              child: SizedBox(
                width: 150,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _update();
                    Navigator.pushNamed(context, '/StaffManagement');
                  },
                  icon: Icon(Icons.save),
                  label: Text("Simpan"),
                ),
              ),
            )
          ],
        ));
  }
}
