import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'main.dart';

class EditProfile extends StatefulWidget {
  final String id;
  final String nama;
  final String nim;
  final String status;
  final String ipk;
  final String thn_lulus;
  final String prodi;
  final String fakultas;
  final String alamat;
  final String pekerjaan;
  final String role;
  final String angkatan;
  final String password;
  const EditProfile({
    required this.id,
    required this.nama,
    required this.nim,
    required this.status,
    required this.ipk,
    required this.thn_lulus,
    required this.prodi,
    required this.fakultas,
    required this.alamat,
    required this.pekerjaan,
    required this.role,
    required this.angkatan,
    required this.password,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _showHidePassword = true;
  TextEditingController id = new TextEditingController();
  TextEditingController nim = new TextEditingController();
  TextEditingController nama = new TextEditingController();
  TextEditingController status = new TextEditingController();
  TextEditingController ipk = new TextEditingController();
  TextEditingController thn_lulus = new TextEditingController();
  TextEditingController prodi = new TextEditingController();
  TextEditingController fakultas = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController pekerjaan = new TextEditingController();
  TextEditingController angkatan = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  void initState() {
    super.initState();
    id.text = widget.id;
    nim.text = widget.nim;
    nama.text = widget.nama;
    status.text = widget.status;
    ipk.text = widget.ipk;
    thn_lulus.text = widget.thn_lulus;
    prodi.text = widget.prodi;
    fakultas.text = widget.fakultas;
    alamat.text = widget.alamat;
    pekerjaan.text = widget.pekerjaan;
    angkatan.text = widget.angkatan;
    password.text = widget.password;
  }

  Future _update() async {
    final response = await http
        .post(Uri.parse("http://192.168.100.164/android/update.php"), body: {
      "id": id.text,
      "alamat": alamat.text,
      "pekerjaan": pekerjaan.text,
      "password": password.text,
    });
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: alamat,
                  maxLines: 4,
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
                  height: 20,
                ),
                TextField(
                  controller: pekerjaan,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Pekerjaan"),
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _update();
                      Navigator.pushNamed(context, '/MahasiswaPage');
                    },
                    icon: Icon(
                      Icons.save,
                      size: 24.0,
                    ),
                    label: Text('Simpan'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
