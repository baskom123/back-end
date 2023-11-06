import 'package:flutter/material.dart';
import 'package:tugas_1/models/DBHelper.dart';
import 'package:tugas_1/models/menu.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ScreenProvider extends ChangeNotifier {
  final DBHelper dbHelper = DBHelper.intance;
  List<Menu> _menus = [];

  List<Menu> get menus => _menus;

  bool isSearching = false;

  set isFristNmaeEmpty(isFristNmaeEmpty) {
    
  }

  Future<List<Menu>?> initalizeMenus() async {
    final dbHelper = DBHelper.intance;

    Future<List<Map<String, dynamic>>?> getMenuData() async {
      final res = await http.get(Uri.parse(
        //Mengambil data JSON dari web
          "https://raw.githubusercontent.com/baskom123/Resources/main/data.json"));

      if (res.statusCode == 200) {
        final decodeData = json.decode(res.body);

        if (decodeData is Map<String, dynamic> &&
            decodeData.containsKey("data")) {
          final menuData = decodeData["data"];

          if (menuData is List &&
              menuData.isNotEmpty &&
              menuData[0] is Map<String, dynamic>) {
            return List<Map<String, dynamic>>.from(menuData);
          }
        }
        throw Exception("Gagal mengambil data: Format data tidak sesuai");
      } else {
        throw Exception("Gagal mengambil data");
      }
    }

    try {
      final menuData = await getMenuData();

      for (final MenuMap in menuData!) {
        final menu = Menu(
          name: MenuMap['name'],
          img: MenuMap['img'],
          harga: MenuMap['harga'],
          rate: MenuMap['rating'],
          desk: MenuMap['deskripsi'],
        );

        final existingMenu = await dbHelper.getMenuByName(menu.name);

        if (existingMenu == null) {
          await dbHelper.insertMenu(menu);
        } else {
          await dbHelper.updateMenu(menu);
        }
      }

      final menus = await dbHelper.getMenus();
      _menus = menus;
      return menus;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  List<Menu> searchResults = [];

  void searchMenus(String query) {
    searchResults.clear();

    for (final menu in menus) {
      if (menu.name.toLowerCase().contains(query.toLowerCase())) {
        searchResults.add(menu);
      }
    }
    notifyListeners();
  }

  void clearMenus() {
    searchResults.clear();
    notifyListeners();
  }

  DateTime date = DateTime.now();
  bool isDataSet = false;
}
