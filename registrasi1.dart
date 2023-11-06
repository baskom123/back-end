import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_1/authentication.dart';
import 'package:tugas_1/login.dart';
import 'package:tugas_1/provider.dart';

class Registrasi1 extends StatefulWidget {
  const Registrasi1({Key? key}) : super(key: key);

  @override
  State<Registrasi1> createState() => _Registrasi1State();
}

class _Registrasi1State extends State<Registrasi1> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  late AuthFirebase auth;

  bool? UserNameEmpty;
  bool? IsEmailEmpty;
  bool? IsPasswordEmpty;
  DateTime selectedDate = DateTime.now();
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isPasswordVisible = false;
    var prov = Provider.of<ScreenProvider>(context);

    void _togglePasswordVisibility() {
      setState(() {
        _isPasswordVisible = !_isPasswordVisible;
      });
    }

    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('CoffeShope'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                const Text(
                  'Daftar Gratis Sekarang!!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "Daftar Akunmu!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          label: const Text("username"),
                          errorText: IsEmailEmpty == true
                              ? 'Alamat Email harus di isi'
                              : null,
                          filled: true,
                          fillColor: Colors.white,
                          border: const UnderlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: "Alamat Email",
                          hintStyle: const TextStyle(color: Colors.black12),
                          labelText: "Alamat Email",
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: password,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          errorText: IsPasswordEmpty == true
                              ? 'Kata Sandi harus di isi'
                              : null,
                          filled: true,
                          fillColor: Colors.white,
                          border: const UnderlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: "Kata Sandi",
                          hintStyle: const TextStyle(color: Colors.black12),
                          labelText: "Kata Sandi",
                          labelStyle: const TextStyle(color: Colors.black),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: password,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          errorText: IsPasswordEmpty == true
                              ? 'Ketik Ulang Kata Sandi Harus Diisi'
                              : null,
                          filled: true,
                          fillColor: Colors.white,
                          border: const UnderlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: "Ketik Ulang Kata Sandi",
                          hintStyle: const TextStyle(color: Colors.black12),
                          labelText: "Ketik Ulang Kata Sandi",
                          labelStyle: const TextStyle(color: Colors.black),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _date,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_month),
                            labelText: "Pilih Tanggal Lahir Kamu"),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now());

                          if (pickeddate != null) {
                            setState(() {
                              _date.text = pickeddate.toString();
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        prov.isFristNmaeEmpty = email.text.isEmpty;
                        password.text.isEmpty;

                        if (email.text.isEmpty) {
                          setState(() {
                            IsEmailEmpty = true;
                          });
                        }
                        if (password.text.isEmpty) {
                          setState(() {
                            IsPasswordEmpty = true;
                          });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyLogin()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.black),
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
