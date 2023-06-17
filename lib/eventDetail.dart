import 'package:flutter/material.dart';
import 'event.dart';

class EventDetail extends StatefulWidget {
  final Map ListData;
  const EventDetail({super.key, required this.ListData});

  @override
  State<EventDetail> createState() => EventDetailState();
}

class EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ListData['event_title']),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Image.asset('assets/logo.png'),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              widget.ListData['event_title'],
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
                        widget.ListData['event_pos'],
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
                        widget.ListData['event_time'],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          
          Container(
            margin: EdgeInsets.all(10),
            child: Text(widget.ListData['event_desc'],),
          ),
        ],
      ),
    );
  }
}
