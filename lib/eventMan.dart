import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'eventManDetail.dart';

class EventManagement extends StatefulWidget {
  const EventManagement({super.key});

  @override
  State<EventManagement> createState() => _EventManagementState();
}

class _EventManagementState extends State<EventManagement> {
  List _listData = [];
  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2/android/getEvent.php"));
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

  Future _delete(String event_id) async {
    try {
      final response = await http
          .post(Uri.parse("http://10.0.2.2/android/deleteEvent.php"), body: {
        "event_id": event_id,
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
        title: Text("Event Management"),
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
                      builder: ((context) => EventManDetail(
                            ListData: {
                              "event_id": _listData[index]['event_id'],
                              "event_title": _listData[index]['event_title'],
                              "event_desc": _listData[index]['event_desc'],
                              "event_pos": _listData[index]['event_pos'],
                              "event_time": _listData[index]['event_time'],
                              "event_post_date": _listData[index]
                                  ['event_post_date'],
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
                            Text(_listData[index]['event_title']),
                            SizedBox(
                              width: 10,
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
                                                  _delete(_listData[index]
                                                      ['event_id']);
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
          Navigator.pushNamed(context, '/AddEvent');
        },
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
