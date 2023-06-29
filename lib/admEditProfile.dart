import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'main.dart';

class EditProfileAdmin extends StatefulWidget {
  final String id;
  final String nim;
  final String nama;
  final String alamat;
  final String password;
  const EditProfileAdmin({
    super.key,
    required this.id,
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.password,
  });

  @override
  State<EditProfileAdmin> createState() => _EditProfileAdminState();
}

class _EditProfileAdminState extends State<EditProfileAdmin> {
  bool _showHidePassword = true;
  TextEditingController id = TextEditingController();
  TextEditingController nim = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController password = TextEditingController();

  Future _update() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2/android/updateProfile.php"), body: {
      "id": id.text,
      "nim": nim.text,
      "nama": nama.text,
      "alamat": alamat.text,
      "password": password.text,
    });
    if (response.statusCode == 200) {
      return true;
      print(response.body);
    }

    return false;
  }

  void _resetForm() {
    nama.clear();
    alamat.clear();
  }

  @override
  void initState() {
    super.initState();
    id.text = widget.id;
    nim.text = widget.nim;
    nama.text = widget.nama;
    alamat.text = widget.alamat;
    password.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          overflow: TextOverflow.fade,
          maxLines: 1,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _resetForm();
            },
            icon: Icon(Icons.restore),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  enabled: false,
                  controller: nim,
                  keyboardType: TextInputType.text,
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
                  maxLines: 15,
                  controller: alamat,
                  keyboardType: TextInputType.multiline,
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
                  Navigator.pushNamed(context, '/AdminPage');
                },
                icon: Icon(Icons.save),
                label: Text("Simpan"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
