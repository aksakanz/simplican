import 'package:flutter/material.dart';
import 'main.dart';

class MahasiswaPage extends StatelessWidget {
  final String nama;
  final String nim;
  final String status;
  final String ipk;
  final String thn_lulus;
  final String prodi;
  final String fakultas;
  final String alamat;
  final String pekerjaan;
  final String role;
  final String angkatan;
  const MahasiswaPage({
    required this.nama,
    required this.nim,
    required this.status,
    required this.ipk,
    required this.thn_lulus,
    required this.prodi,
    required this.fakultas,
    required this.alamat,
    required this.pekerjaan,
    required this.role,
    required this.angkatan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Center(
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
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 0, 0),
                  child: Text(
                    "$nama",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 55, 0, 0),
                  child: Text(
                    "$nim",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(280, 35, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/LoginPage');
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
                    child: Text("Profile Anda"),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 350,
                    height: 550,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 224, 224, 224),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 170, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Nama :"),
                          Text("$nama"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("NIM :"),
                          Text("$nim"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Fakultas :"),
                          Text("$fakultas"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Program Studi :"),
                          Text("$prodi"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Status :"),
                          Text("$status"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Angkatan :"),
                          Text("$angkatan"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Tahun Lulus :"),
                          Text("$thn_lulus"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("IPK :"),
                          Text("$ipk"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Alamat :"),
                          Text("$alamat"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Pekerjaan :"),
                          Text("$pekerjaan"),
                        ],
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 480, 0, 0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/EditProfile');
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 24.0,
                      ),
                      label: Text('Ubah Profile'),
                    ),
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
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
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
                Container(
                  margin: EdgeInsets.fromLTRB(0, 570, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/Event');
                        },
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset('assets/elg.jpg'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Event Kampus',
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/Job');
                        },
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset('assets/jlg.jpg'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Job Vacancy',
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
