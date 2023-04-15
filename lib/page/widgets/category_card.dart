import 'package:bisiindo/models/category_model.dart';
import 'package:bisiindo/models/product_model.dart';
import 'package:bisiindo/page/content/category_kata.dart';
import 'package:bisiindo/providers/product_provider.dart';
import 'package:bisiindo/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({@required this.product});
  final CategoryModel product;
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return GestureDetector(
      onTap: () async {
        await productProvider.getProductsCategories(product.id);
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return CategoryKata(
            title: product.name,
            listProduct: productProvider.productsCategories,
          );
        }));
      },
      child: Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.only(left: defaulMargin, right: defaulMargin),
          height: 60,
          width: 335,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xff64BC46),
                    Color(0xff61965C),
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: perimaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBolt),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )),
    );
  }
}
