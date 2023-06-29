import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AddJob extends StatefulWidget {
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  TextEditingController jobv_id = new TextEditingController();
  TextEditingController jobv_title = new TextEditingController();
  TextEditingController jobv_desc = new TextEditingController();
  TextEditingController jobv_date = new TextEditingController();
  TextEditingController jobv_post_date = new TextEditingController();
  TextEditingController job_post_by = new TextEditingController();
  TextEditingController jobv_pos = new TextEditingController();

  Future _update() async {
    final response = await http
        .post(Uri.parse("http://10.0.2.2/android/uploadJob.php"), body: {
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

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      currentDate: DateTime.now(),
      helpText: 'Pilih Tanggal',
      cancelText: 'Batal',
      confirmText: 'Pilih',
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (picked != null && picked != selectedDate) {
      String formattedDate = DateFormat('dd-MMMM-yyyy').format(picked);
      setState(() {
        selectedDate = picked;
        jobv_date.text = formattedDate;
      });
    }
  }

  String getTodayDate() {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MMMM-yyyy');
    return formatter.format(now);
  }

  @override
  void initState() {
    super.initState();
    jobv_post_date.text = getTodayDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
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
                  readOnly: true,
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
                  onTap: () {
                    _selectDate(context);
                  },
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
