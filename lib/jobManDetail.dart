import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class JobManDetail extends StatefulWidget {
  final Map ListData;
  const JobManDetail({
    super.key,
    required this.ListData,
  });

  @override
  State<JobManDetail> createState() => _JobManDetailState();
}

class _JobManDetailState extends State<JobManDetail> {
  TextEditingController jobv_id = new TextEditingController();
  TextEditingController jobv_title = new TextEditingController();
  TextEditingController jobv_desc = new TextEditingController();
  TextEditingController jobv_date = new TextEditingController();
  TextEditingController jobv_post_date = new TextEditingController();
  TextEditingController job_post_by = new TextEditingController();
  TextEditingController jobv_pos = new TextEditingController();

  Future _update() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2/android/updateJob.php"), body: {
      "jobv_id": jobv_id.text,
      "jobv_title": jobv_title.text,
      "jobv_desc": jobv_desc.text,
      "jobv_date": jobv_date.text,
      "jobv_post_date": jobv_post_date.text,
      "job_post_by": job_post_by.text,
      "jobv_pos": jobv_pos.text,
    });
    if (response.statusCode == 200) {
      print(response.body);
      return true;
    }

    return false;
  }

  void _resetForm() {
    jobv_title.clear();
    jobv_desc.clear();
    jobv_date.clear();
    jobv_post_date.clear();
    job_post_by.clear();
    jobv_pos.clear();
  }

  @override
  Widget build(BuildContext context) {
    jobv_id.text = widget.ListData['jobv_id'];
    jobv_title.text = widget.ListData['jobv_title'];
    jobv_desc.text = widget.ListData['jobv_desc'];
    jobv_date.text = widget.ListData['jobv_date'];
    jobv_post_date.text = widget.ListData['jobv_post_date'];
    job_post_by.text = widget.ListData['job_post_by'];
    jobv_pos.text = widget.ListData['jobv_pos'];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Edit Data - "),
            Container(
              width: 150,
              child: Text(
                widget.ListData['jobv_title'],
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
            )
          ],
        ),
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
                  controller: jobv_title,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Judul Job Vacancy"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: jobv_pos,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Lokasi Job Vacancy"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: jobv_date,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Waktu Job Vacancy"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  maxLines: 15,
                  controller: jobv_desc,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Deskripsi Job Vacancy"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  enabled: false,
                  controller: jobv_post_date,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Tanggal Posting"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  enabled: false,
                  controller: job_post_by,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    label: Text("Diupload Oleh"),
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
                  Navigator.pushNamed(context, '/JobMan');
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
