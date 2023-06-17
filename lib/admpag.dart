import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class AdminPage extends StatefulWidget {
  final String nama;
  const AdminPage({
    super.key,
    required this.nama,
  });

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(25, 10, 20, 0),
                child: SizedBox(
                  width: 350,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(35, 30, 30, 0),
                child: Text(
                  "SELAMAT DATANG KEMBALI!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(35, 55, 30, 0),
                child: Text(
                  "$nama",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(180, 130, 0, 0),
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 160, 20, 10),
                child: SizedBox(
                  width: 350,
                  height: 500,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 224, 224),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Center(
                      child: Container(
                        child: Opacity(
                          opacity: 0.1,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('assets/logo.png'),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(65, 190, 50, 0),
                child: Row(
                  children: [
                    InkWell(
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Text(
                                "Staff Management",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Text(
                                "Mahasiswa Management",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(65, 330, 50, 0),
                child: Row(
                  children: [
                    InkWell(
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Text(
                                "Event Management",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Text(
                                "Job Vacancy Management",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(65, 470, 50, 0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/AdminProfile');
                      },
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: Text(
                                "Profile",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 790, 0, 0),
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: const Color.fromARGB(255, 118, 184, 238),
                child: Center(
                  child: Text(
                    "Login Sebagai : $role",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
