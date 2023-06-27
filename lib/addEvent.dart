import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddEvent extends StatefulWidget {
  const AddEvent({
    super.key,
  });

  @override
  State<AddEvent> createState() => _AddEvent();
}

class _AddEvent extends State<AddEvent> {
  TextEditingController event_id = new TextEditingController();
  TextEditingController event_title = new TextEditingController();
  TextEditingController event_desc = new TextEditingController();
  TextEditingController event_pos = new TextEditingController();
  TextEditingController event_time = new TextEditingController();
  TextEditingController event_post_date = new TextEditingController();

  Future _update() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2/android/updateEvent.php"), body: {
      "event_id": event_id.text,
      "event_title": event_title.text,
      "event_desc": event_desc.text,
      "event_pos": event_pos.text,
      "event_time": event_time.text,
      "event_post_date": event_post_date.text,
    });
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  void _resetForm() {
    event_title.clear();
    event_desc.clear();
    event_pos.clear();
    event_time.clear();
    event_post_date.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Event"),
        actions: [
          IconButton(
            onPressed: () {
              _resetForm();
            },
            icon: Icon(Icons.restore),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: event_title,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Judul Event"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: event_pos,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Lokasi Event"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: event_time,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Waktu Event"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  maxLines: 15,
                  controller: event_desc,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Deskripsi Event"),
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
                  _update();
                  Navigator.pushNamed(context, '/EventManagement');
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
