import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simplican/mhsManDetail.dart';

class MhsManagement extends StatefulWidget {
  const MhsManagement({super.key});

  @override
  State<MhsManagement> createState() => _MhsManagementState();
}

class _MhsManagementState extends State<MhsManagement> {
  List _listData = [];
  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2/android/getMhs.php"));
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
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mahasiswa Management"),
        centerTitle: true,
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
                      builder: ((context) => MhsManDetail(
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
                            Text(_listData[index]['nama']),
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
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
