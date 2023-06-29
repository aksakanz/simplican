import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nimTxt = new TextEditingController();
  TextEditingController passwordTxt = new TextEditingController();
  String msg = '';

  bool _isLoading = false;

  Future _login() async {
    final response =
        await http.post(Uri.parse("http://10.0.2.2/android/login.php"), body: {
      "nim": nimTxt.text,
      "password": passwordTxt.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Username / Password salah! Silahkan coba kembali";
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = true;
      });
      if (datauser[0]['role'] == 'mahasiswa') {
        Navigator.pushReplacementNamed(context, '/MahasiswaPage');
      } else if (datauser[0]['role'] == 'admin') {
        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (datauser[0]['role'] == 'alumni') {
        Navigator.pushReplacementNamed(context, '/MahasiswaPage');
      }
      setState(() {
        id = datauser[0]['id'];
        nama = datauser[0]['nama'];
        nim = datauser[0]['nim'];
        status = datauser[0]['status'];
        ipk = datauser[0]['ipk'];
        thn_lulus = datauser[0]['thn_lulus'];
        prodi = datauser[0]['prodi'];
        fakultas = datauser[0]['fakultas'];
        alamat = datauser[0]['alamat'];
        pekerjaan = datauser[0]['pekerjaan'];
        role = datauser[0]['role'];
        angkatan = datauser[0]['angkatan'];
        password = datauser[0]['password'];
      });
    }

    return datauser;
  }

  bool _showHidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SizedBox(
          width: 350,
          height: 550,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 224, 224, 224),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/logo.png'),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Selamat Datang Di E-trace Esa Unggul"),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        msg,
                        style: TextStyle(
                            color: Colors.white, backgroundColor: Colors.red),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: nimTxt,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Username',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller: passwordTxt,
                        obscureText: _showHidePassword,
                        onTap: () {
                          setState(() {
                            _showHidePassword = !_showHidePassword;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          hintText: 'Kata Sandi',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(
                            _showHidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isLoading = true;
                              });
                              _login();
                            },
                            child: Text("Login")),
                      ),
                    ],
                  ),
                  if (_isLoading)
                    Center(
                      child: CircularProgressIndicator(),
                    )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
