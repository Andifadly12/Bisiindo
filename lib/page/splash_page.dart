import 'dart:async';
import 'package:bisiindo/providers/product_provider.dart';
import 'package:bisiindo/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  // dulrasi antara page splas ke home
  // durasi waktu antara home page dengan login
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/home');
  }

  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          //logo fikom dan umi
          Center(
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: defaulMargin, right: defaulMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/univ.png',
                          width: 80,
                        ),
                        Image.asset(
                          'assets/fikom.png',
                          width: 80,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // logo bisiindo
          Center(
            child: Container(
              width: 130,
              height: 150,
              margin: EdgeInsets.only(top: 231),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5),
                  image: DecorationImage(image: AssetImage('assets/logo.png'))),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "BISIINDO",
            style:
                perimaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBolt),
          )
        ],
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        body: Column(
          children: [header()],
        ));
  }
}
