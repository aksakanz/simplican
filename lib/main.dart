import 'package:flutter/material.dart';
import 'package:simplican/addAlumni.dart';
import 'package:simplican/addEvent.dart';
import 'package:simplican/addMhs.dart';
import 'package:simplican/addStaff.dart';
import 'package:simplican/admEditProfile.dart';
import 'package:simplican/admProfile.dart';
import 'package:simplican/admpag.dart';
import 'package:simplican/alumniMan.dart';
import 'package:simplican/eventMan.dart';
import 'package:simplican/job.dart';
import 'package:simplican/jobMan.dart';
import 'package:simplican/mhsman.dart';
import 'package:simplican/staffMan.dart';
import 'addJob.dart';
import 'event.dart';
import 'mhspage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'login.dart';
import 'editprofile.dart';
import 'eventDetail.dart';
import 'event.dart';

String id = '';
String nama = '';
String nim = '';
String status = '';
String ipk = '';
String thn_lulus = '';
String prodi = '';
String fakultas = '';
String alamat = '';
String pekerjaan = '';
String role = '';
String angkatan = '';
String password = '';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/MahasiswaPage': (BuildContext context) => new MahasiswaPage(
              nama: nama,
              nim: nim,
              status: status,
              ipk: ipk,
              thn_lulus: thn_lulus,
              prodi: prodi,
              fakultas: fakultas,
              alamat: alamat,
              pekerjaan: pekerjaan,
              role: role,
              angkatan: angkatan,
            ),
        '/LoginPage': (BuildContext context) => new LoginPage(),
        '/EditProfile': (BuildContext context) => new EditProfile(
              id: id,
              nama: nama,
              nim: nim,
              status: status,
              ipk: ipk,
              thn_lulus: thn_lulus,
              prodi: prodi,
              fakultas: fakultas,
              alamat: alamat,
              pekerjaan: pekerjaan,
              role: role,
              angkatan: angkatan,
              password: password,
            ),
        '/Event': (BuildContext context) => new Event(
              nim: nim,
            ),
        '/Job': (BuildContext context) => new Job(),
        '/AdminPage': (BuildContext context) => new AdminPage(
              nama: nama,
            ),
        '/AdminProfile': (BuildContext context) => new AdminProfile(
              nim: nim,
              nama: nama,
              alamat: alamat,
            ),
        '/EditProfileAdmin': (BuildContext context) => new EditProfileAdmin(
              id: id,
              nim: nim,
              nama: nama,
              alamat: alamat,
              password: password,
            ),
        '/StaffManagement': (BuildContext context) => new StaffManagement(),
        '/AddStaff': (BuildContext context) => new AddStaff(),
        '/MhsManagement': (BuildContext context) => new MhsManagement(),
        '/AddMhs': (BuildContext context) => new AddMhs(),
        '/AlumniManagement': (BuildContext context) => new AlumniManagement(),
        '/AddAlumni': (BuildContext context) => new AddAlumni(),
        '/EventManagement': (BuildContext context) => new EventManagement(),
        '/AddEvent': (BuildContext context) => new AddEvent(),
        '/JobMan': (BuildContext context) => new JobMan(),
        '/AddJob': (BuildContext context) => new AddJob(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
