import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';
// import 'package:tugas_1/pages/detaiScreen.dart';
import 'package:tugas_1/pages/home.dart';
import 'package:tugas_1/registrasi1.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isPasswordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("Akun Anda Berhasil Masuk!"),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: const Text("CoffeShop"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0, top: 50),
            ),
            Text(
              "Selamat Datang Kembali",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25,
                height: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Masukkan Akunmu!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Alamat Email",
                      helperStyle: TextStyle(color: Colors.black12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "Kata Sandi",
                      hintStyle: TextStyle(color: Colors.black12),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 3),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ElevatedButton(
                  onPressed: () {
                  
                    showSnackBar(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text(
                    "Masuk Akun",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10.0)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0, top: 20),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registrasi1(),
                          ));
                    },
                    child: Text(
                      "Tidak Punya Akun?Klik untuk Mendaftar",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
                SizedBox(height: 15),
                Text(
                  "Atau Masuk dengan",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.g_mobiledata,
                                color: Colors.black,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Google ",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10.0)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.facebook,
                                color: Colors.black,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Facebook ",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10.0)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            SizedBox(height: 3),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Lupa Password?",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
