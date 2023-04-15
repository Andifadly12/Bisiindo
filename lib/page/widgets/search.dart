import 'package:bisiindo/models/category_model.dart';
import 'package:bisiindo/models/product_model.dart';
import 'package:bisiindo/models/vidio_model.dart';
import 'package:bisiindo/services/product_servece.dart';
import 'package:bisiindo/theme.dart';
import 'package:flutter/material.dart';

import '../content/video.dart';

class SearchUser extends SearchDelegate {
  final ProductService _product = ProductService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
          Navigator.pop(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: _product.getProductsWithsearch(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<ProductModel> data = snapshot.data;
          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    final dataVideo = data[index];
                    // print(data[index].name);
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Video(
                        title: dataVideo.name,
                        gallery: dataVideo.gallaries[0].url,
                        videoModel: dataVideo.vidoegallary,
                      );
                    }));
                  },
                  title: Text(
                    '${data[index].name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  // Row(
                  //   children: [
                  //     Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             '${data[index].name}',
                  //             style: TextStyle(
                  //                 fontSize: 18, fontWeight: FontWeight.w600),
                  //           )
                  //         ]),
                  //   ],
                  // ),
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('search'),
    );
  }
}
