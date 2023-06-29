import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simplican/jobManDetail.dart';

class JobMan extends StatefulWidget {
  const JobMan({super.key});

  @override
  State<JobMan> createState() => _JobManState();
}

class _JobManState extends State<JobMan> {
  List _listData = [];
  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2/android/getJob.php"));
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
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Vacancy Management"),
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
                      builder: ((context) => JobManDetail(
                            ListData: {
                              "jobv_id": _listData[index]['jobv_id'],
                              "jobv_title": _listData[index]['jobv_title'],
                              "jobv_desc": _listData[index]['jobv_desc'],
                              "jobv_date": _listData[index]['jobv_date'],
                              "jobv_post_date": _listData[index]
                                  ['jobv_post_date'],
                              "job_post_by": _listData[index]['job_post_by'],
                              "jobv_pos": _listData[index]['jobv_pos'],
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
                            Text(_listData[index]['jobv_title']),
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
                                                      ['jobv_id']);
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
          Navigator.pushNamed(context, '/AddJob');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
