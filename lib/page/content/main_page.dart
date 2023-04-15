import 'dart:io';

import 'package:bisiindo/page/widgets/category_card.dart';
import 'package:bisiindo/page/widgets/data.dart';
import 'package:bisiindo/page/widgets/search.dart';
import 'package:bisiindo/providers/product_provider.dart';

import 'package:bisiindo/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _controllerSearch = TextEditingController();
  Widget searchTextField = Text(
    'Kategory',
    style: TextStyle(color: Colors.black),
  );
  bool search = false;
  Color _bgColor = backgroundColor1;
  List list = [];

  @override
  void initState() {
    super.initState();
    //saat file ini dijalankan pertama kali
    //maka data list akan diisi dengan data dari data.dart
    list.addAll(items);
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Kategory',
          style: perimaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(
                Icons.search,
                color: primaryTextColor,
                size: 30,
              ))
        ],
      );
    }

    Widget body() {
      return Container(
        margin: EdgeInsets.only(
            right: defaulMargin,
            left: defaulMargin,
            top: defaulMargin,
            bottom: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              children: productProvider.products
                  .map(
                    (product) => CategoryCard(
                      product: product,
                    ),
                  )
                  .toList()),
        ),
      );
    }

    Widget customButtom() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(backgroundColor: backgroundColor1, items: [
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Image.asset(
                  'assets/home.png',
                  width: 24,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(exit(0));
                },
                child: Image.asset(
                  'assets/logout.png',
                  width: 24,
                ),
              ),
              label: ''),
        ]),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: customButtom(),
      appBar: header(),
      body: body(),
    );
  }

  Widget appSearch(BuildContext context) {
    return TextField(
      controller: _controllerSearch,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
          icon: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/content');
            },
          ),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.grey)),
      // setiap ada perubahan, jalankan fungsi _searchName
      onChanged: (name) {},
    );
  }
}
