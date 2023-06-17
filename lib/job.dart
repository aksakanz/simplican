import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simplican/jobDetail.dart';

class Job extends StatefulWidget {
  const Job({super.key});

  @override
  State<Job> createState() => _JobState();
}

class _JobState extends State<Job> {
  List _listdata = [];
  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2/android/job.php"));
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

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Yang Tersedia Saat Ini"),
        centerTitle: true,
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
                        builder: ((context) => JobDetail(
                              ListData: {
                                "jobv_id": _listdata[index]['jobv_id'],
                                "jobv_title": _listdata[index]['jobv_title'],
                                "jobv_desc": _listdata[index]['jobv_desc'],
                                "jobv_date": _listdata[index]['jobv_date'],
                                "jobv_post_date": _listdata[index]
                                    ['jobv_post_date'],
                                "jobv_post_by": _listdata[index]
                                    ['jobv_post_by'],
                                "jobv_pos": _listdata[index]['jobv_pos'],
                              },
                            )),
                      ),
                    );
                  },
                  child: Card(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.maxFinite,
                        child: Image.asset('assets/logo.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(),
                      ),
                      Text(_listdata[index]['jobv_title']),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(Icons.location_on),
                                Text(_listdata[index]['jobv_pos'])
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.access_time),
                                Text(_listdata[index]['jobv_date'])
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )));
            })),
      ),
    );
  }
}
