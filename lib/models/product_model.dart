import 'package:bisiindo/models/category_model.dart';
import 'package:bisiindo/models/gallery_model.dart';
import 'package:bisiindo/models/vidio_model.dart';
import 'package:bisiindo/page/content/video.dart';

class ProductModel {
  int id;
  int categories_id;
  String name;
  String tags;
  CategoryModel category;
  DateTime createdAt;
  DateTime updatedAt;
  VidioModel vidoegallary;
  List<GalleryModel> gallaries;

  ProductModel(
      {this.id,
      this.categories_id,
      this.name,
      this.tags,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.vidoegallary,
      this.gallaries});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categories_id = json['categories_id'];
    name = json['name'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    if (json['vidoegallary'] != null) {
      vidoegallary = VidioModel.fromJson(json['vidoegallary']);
    } else {
      vidoegallary = null;
    }
    gallaries = json['gallaries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories_id': categories_id,
      'name': name,
      'tags': tags,
      'category': category.toJson(),
      'vidoegallary': vidoegallary.toJson(),
      'gallaries': gallaries.map((gallery) => gallery.toJson()).toList(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString()
    };
  }
}
