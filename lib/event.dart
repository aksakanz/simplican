import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simplican/main.dart';

import 'eventDetail.dart';

class Event extends StatefulWidget {
  final String nim;
  const Event({super.key, required this.nim});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  List _listdata = [];
  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.0.2.2/android/event.php"));
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
        title: Text("Event Saat Ini"),
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
                      builder: ((context) => EventDetail(
                            ListData: {
                              "event_id": _listdata[index]['event_id'],
                              "event_title": _listdata[index]['event_title'],
                              "event_desc": _listdata[index]['event_desc'],
                              "event_pos": _listdata[index]['event_pos'],
                              "event_time": _listdata[index]['event_time'],
                              "event_post_date": _listdata[index]
                                  ['event_post_date'],
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
                      Text(_listdata[index]['event_title']),
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
                                Text(_listdata[index]['event_pos'])
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
                                Text(_listdata[index]['event_post_date'])
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
