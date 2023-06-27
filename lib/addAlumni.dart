import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddAlumni extends StatefulWidget {
  const AddAlumni({super.key});

  @override
  State<AddAlumni> createState() => _AddAlumni();
}

class _AddAlumni extends State<AddAlumni> {
  bool _showHidePassword = true;
  TextEditingController id = new TextEditingController();
  TextEditingController nim = new TextEditingController();
  TextEditingController nama = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController status = new TextEditingController();
  TextEditingController ipk = new TextEditingController();
  TextEditingController thn_lulus = new TextEditingController();
  TextEditingController prodi = new TextEditingController();
  TextEditingController fakultas = new TextEditingController();
  TextEditingController pekerjaan = new TextEditingController();
  TextEditingController angkatan = new TextEditingController();

  Future _save() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2/android/uploadAlumni.php"), body: {
      "id": id.text,
      "nim": nim.text,
      "nama": nama.text,
      "alamat": alamat.text,
      "password": password.text,
      "status": status.text,
      "ipk": ipk.text,
      "thn_lulus": thn_lulus.text,
      "prodi": prodi.text,
      "fakultas": fakultas.text,
      "pekerjaan": pekerjaan.text,
      "angkatan": angkatan.text,
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
    status.clear();
    ipk.clear();
    thn_lulus.clear();
    prodi.clear();
    fakultas.clear();
    pekerjaan.clear();
    angkatan.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Mahasiswa"),
        centerTitle: true,
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
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: status,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Status"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: ipk,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("IPK"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: thn_lulus,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Tahun Lulus"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: prodi,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Program Studi"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: fakultas,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Fakultas"),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: angkatan,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Angkatan"),
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
                  _save();
                  Navigator.pushNamed(context, '/AlumniManagement');
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
