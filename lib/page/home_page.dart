import 'dart:io';

import 'package:bisiindo/theme.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //logo fikom dan umi dan sekaligus header
    Widget header() {
      return Column(
        children: [
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
        ],
      );
    }

    //isi dari content termasuk logo,  mulai dan exit
    Widget content() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 5),
                image: DecorationImage(image: AssetImage('assets/logo.png'))),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            width: 196,
            height: 44,
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/content');
                },
                style: TextButton.styleFrom(
                    backgroundColor: backgroundColor1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  "Mulai",
                  style: perimaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 13),
            width: 196,
            height: 44,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: backgroundColor1),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/tentang');
                },
                child: Text(
                  'Tentang',
                  style: perimaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 13),
            width: 196,
            height: 44,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor: backgroundColor1),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(exit(0));
                },
                child: Text(
                  'Keluar',
                  style: perimaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            ),
          )
        ],
      );
    }

    Widget backround() {
      return ClipPath(
        clipper: MyClipper(),
        child: Container(
          height: 250,
          decoration: BoxDecoration(color: backgroundColor1),
          child: header(),
        ),
      );
    }

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [backround(), content()],
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 6, size.height * 0.5, size.width, size.height * 1);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
