import 'package:flutter/material.dart';

class JobDetail extends StatefulWidget {
  final Map ListData;
  const JobDetail({super.key, required this.ListData});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ASD"),
      ),
      body: ListView(
        children: [
          Image.asset('assets/logo.png'),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              widget.ListData['jobv_title'],
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        widget.ListData['jobv_pos'],
                      )
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.access_time),
                      Text(
                        widget.ListData['jobv_date'],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              widget.ListData['jobv_desc'],
            ),
          ),
        ],
      ),
    );
  }
}
