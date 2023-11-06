import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_1/models/DBHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_1/models/menu.dart';
import 'package:tugas_1/provider.dart';

class Detailpage extends StatefulWidget {
  final String menu;
  const Detailpage({super.key, required this.menu});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  bool isWrap = true;

  bool isNoRate = true;
  double currentRate = 0.0;

  TextEditingController reviewController = TextEditingController();

  List<Widget> reviewList = [];

  late SharedPreferences pref;
  DBHelper _dbHelper = DBHelper.intance;
  late Menu _menu;

  @override
  void initState() {
    super.initState();
    _loadMenu();
  }

  Future<void> _loadMenu() async {
    final menu = await _dbHelper.getMenuByName(widget.menu);
    if (menu != null) {
      setState(() {
        _menu = menu;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ScreenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                width: 300,
                height: 300,
                child: Image.asset(
                  _menu.img,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  horizontalTitleGap: 0,
                  leading: Text(
                    _menu.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(children: [
                        const Expanded(flex: 1, child: Text('nama')),
                        Expanded(flex: 3, child: Text(_menu.name))
                      ]),
                    ),
                    Container(
                        child: Column(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(children: [
                          const Expanded(flex: 1, child: Text('img')),
                          Expanded(flex: 3, child: Text(_menu.img))
                        ]),
                      ),
                    ])),
                    Container(
                        child: Column(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Row(children: [
                          const Expanded(flex: 1, child: Text('harga')),
                          Expanded(flex: 3, child: Text(_menu.harga.toString()))
                        ]),
                      ),
                    ])),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              children: [
                                const Expanded(
                                    flex: 1, child: Text('deskripsi')),
                                Expanded(flex: 3, child: Text(_menu.desk))
                              ],
                            ),
                          ),
                          isWrap
                              ? Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    _menu.desk,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.fade,
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    _menu.desk,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                isWrap = !isWrap;
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.blue[5000],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child: isWrap == false
                                  ? const Text(
                                      'Lihat lebih sedikit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : const Text(
                                      'Lihat lebih banyak',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Reviews',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 30),
                          if (reviewList.isEmpty)
                            Center(
                              child: const Text(
                                'belum ada tinjauan \n berikan tinjauan Anda',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            )
                          else
                            Expanded(
                              child: ListView.builder(
                                itemCount: reviewList.length,
                                itemBuilder: (context, index) {
                                  return reviewList[index];
                                },
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   prov.currenRate != null
      // }),
    );
  }
}
