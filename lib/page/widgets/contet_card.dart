import 'dart:developer';

import 'package:bisiindo/models/category_model.dart';
import 'package:bisiindo/models/product_model.dart';
import 'package:bisiindo/page/content/video.dart';
import 'package:bisiindo/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final ProductModel category;
  ContentCard(this.category);
  @override
  Widget build(BuildContext context) {
    log(category.gallaries[0].url);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Video(
            title: category.name,
            gallery: category.gallaries[0].url,
            videoModel: category.vidoegallary,
          );
        }));
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 2, bottom: 10),
        decoration: BoxDecoration(
          color: backgroundColor1,
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(category.gallaries[0].url),
                  ),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1)),
            ),
            const SizedBox(height: 2),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: perimaryTextStyle,
              maxLines: 3,
            )
          ],
        ),
      ),
    );
  }
}
