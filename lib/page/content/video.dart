import 'dart:io';

import 'package:bisiindo/models/category_model.dart';
import 'package:bisiindo/models/gallery_model.dart';
import 'package:bisiindo/models/product_model.dart';
import 'package:bisiindo/models/vidio_model.dart';
import 'package:bisiindo/page/widgets/contet_card.dart';
import 'package:bisiindo/page/widgets/video_card.dart';
import 'package:bisiindo/providers/product_provider.dart';
import 'package:bisiindo/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Video extends StatelessWidget {
  Video({
    @required this.title,
    @required this.gallery,
    @required this.videoModel,
  });
  final String title;
  final String gallery;
  final VidioModel videoModel;
  @override
  Widget build(BuildContext context) {
    // ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Widget header() {
      // print(productProvider.productsCategories[0].vidoegallary.url);
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          title,
          style: perimaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget body() {
      return Container(
          margin: EdgeInsets.only(top: defaulMargin, left: 12, right: 12),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: VideoCard(videoModel, gallery)));
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
