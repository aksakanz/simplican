import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'staffManDetail.dart';

class StaffManagement extends StatefulWidget {
  const StaffManagement({super.key});

  @override
  State<StaffManagement> createState() => _StaffManagementState();
}

class _StaffManagementState extends State<StaffManagement> {
  List _listdata = [];
  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2/android/getAdmin.php"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _listdata = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _delete(String id) async {
    try {
      final response = await http
          .post(Uri.parse("http://10.0.2.2/android/deleteStaff.php"), body: {
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
        title: Text("Staff Management"),
      ),
      body: RefreshIndicator(
        onRefresh: _getData,
        child: ListView.builder(
          itemCount: _listdata.length,
          itemBuilder: ((context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => StaffManagementDetail(
                            ListData: {
                              "id": _listdata[index]['id'],
                              "nim": _listdata[index]['nim'],
                              "nama": _listdata[index]['nama'],
                              "alamat": _listdata[index]['alamat'],
                              "password": _listdata[index]['password'],
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
                            Text(_listdata[index]['nim']),
                            SizedBox(
                              width: 10,
                            ),
                            Text(_listdata[index]['nama']),
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
                                                      _listdata[index]['id']);
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
          Navigator.pushNamed(context, '/AddStaff');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
