import 'dart:io';

import 'package:bisiindo/models/category_model.dart';
import 'package:bisiindo/models/product_model.dart';
import 'package:bisiindo/page/widgets/category_card.dart';
import 'package:bisiindo/page/widgets/contet_card.dart';
import 'package:bisiindo/page/widgets/search.dart';
import 'package:bisiindo/providers/product_provider.dart';
import 'package:bisiindo/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryKata extends StatelessWidget {
  CategoryKata({@required this.title, @required this.listProduct});
  final String title;
  final List<ProductModel> listProduct;
  @override
  Widget build(BuildContext context) {
    // ProductProvider productProvider = Provider.of<ProductProvider>(context);
    print(listProduct.length);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          title,
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

    // Widget body() {
    //   return Container(
    //     margin: EdgeInsets.only(left: 15, right: 15, top: 15),
    //     child: SingleChildScrollView(
    //         scrollDirection: Axis.vertical,
    //         child: Wrap(
    //             children: listProduct
    //                 .map((product) => ContentCard(product))
    //                 .toList())),
    //   );
    // }

    Widget body() {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
                children: listProduct
                    .map((product) => ContentCard(product))
                    .toList())),
      );
    }

    Widget customButtom() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(backgroundColor: backgroundColor1, items: [
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/back.png',
                  width: 24,
                ),
              ),
              label: ''),
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
      bottomNavigationBar: customButtom(),
      appBar: header(),
      body: body(),
    );
  }
}
