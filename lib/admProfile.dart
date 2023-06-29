import 'package:flutter/material.dart';

import 'main.dart';

class AdminProfile extends StatefulWidget {
  final String nim;
  final String nama;
  final String alamat;
  const AdminProfile({
    super.key,
    required this.nim,
    required this.nama,
    required this.alamat,
  });

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 20, 0),
                  child: SizedBox(
                    width: 350,
                    height: 115,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 224, 224, 224),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 30, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Username : $nim"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Nama : $nama"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Alamat : $alamat"),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/EditProfileAdmin');
                        },
                        child: Text("Edit Profile")),
                  ),
                )
              ],
            ),
            Expanded(child: Container()),
            SizedBox(
              width: 500,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/LoginPage');
                },
                icon: Icon(Icons.logout),
                label: Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
