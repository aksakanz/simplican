import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddStaff extends StatefulWidget {
  const AddStaff({super.key});

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  bool _showHidePassword = false;
  TextEditingController nim = new TextEditingController();
  TextEditingController nama = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController password = new TextEditingController();
  void _resetForm() {
    nim.clear();
    nama.clear();
    alamat.clear();
    password.clear();
  }

  Future _save() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2/android/uploadStaff.php"), body: {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Staff"),
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
                  height: 20,
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
                  height: 20,
                ),
                TextField(
                  controller: alamat,
                  maxLines: 5,
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
                  height: 40,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (((context) {
                        return AlertDialog(
                          content: Text(
                            "Apakah anda ingin posting data ini ?",
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Batal"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    _save();
                                    Navigator.pushNamed(
                                        context, '/StaffManagement');
                                  },
                                  child: Text("Simpan"),
                                )
                              ],
                            )
                          ],
                        );
                      })),
                    );
                  },
                  icon: Icon(Icons.save),
                  label: Text("Simpan"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
