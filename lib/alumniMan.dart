import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'alumniManDetail.dart';

class AlumniManagement extends StatefulWidget {
  const AlumniManagement({super.key});

  @override
  State<AlumniManagement> createState() => _AlumniManagementState();
}

class _AlumniManagementState extends State<AlumniManagement> {
  List _listData = [];
  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2/android/getAlumni.php"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _listData = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _delete(String id) async {
    try {
      final response = await http
          .post(Uri.parse("http://10.0.2.2/android/deleteMhs.php"), body: {
        "id": id,
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alumni Management"),
      ),
      body: RefreshIndicator(
        onRefresh: _getData,
        child: ListView.builder(
          itemCount: _listData.length,
          itemBuilder: ((context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => AlumniManDetail(
                            ListData: {
                              "id": _listData[index]['id'],
                              "nim": _listData[index]['nim'],
                              "nama": _listData[index]['nama'],
                              "alamat": _listData[index]['alamat'],
                              "password": _listData[index]['password'],
                              "role": _listData[index]['role'],
                              "status": _listData[index]['status'],
                              "ipk": _listData[index]['ipk'],
                              "thn_lulus": _listData[index]['thn_lulus'],
                              "prodi": _listData[index]['prodi'],
                              "fakultas": _listData[index]['fakultas'],
                              "pekerjaan": _listData[index]['pekerjaan'],
                              "angkatan": _listData[index]['angkatan'],
                            },
                          )),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(_listData[index]['nim']),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_listData[index]['nama']),
                                Text(_listData[index]['prodi']),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (((context) {
                                      return AlertDialog(
                                        content: Text(
                                          "Apakah anda ingin menghapus item ini ?",
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("Batal"),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  _delete(
                                                      _listData[index]['id']);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("Hapus"),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.red,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    })),
                                  );
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/AddAlumni');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
