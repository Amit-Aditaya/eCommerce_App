import 'dart:convert';

import 'package:hive/hive.dart';

part 'product_model.g.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 2)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String slug;
  @HiveField(2)
  final String url;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String content;
  @HiveField(5)
  final String image;
  @HiveField(6)
  final String thumbnail;
  @HiveField(7)
  final String status;
  @HiveField(8)
  final String category;
  @HiveField(9)
  final String publishedAt;
  @HiveField(10)
  final String updatedAt;
  @HiveField(11)
  final int userId;

  ProductModel({
    required this.id,
    required this.slug,
    required this.url,
    required this.title,
    required this.content,
    required this.image,
    required this.thumbnail,
    required this.status,
    required this.category,
    required this.publishedAt,
    required this.updatedAt,
    required this.userId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        slug: json["slug"],
        url: json["url"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        status: json["status"],
        category: json["category"],
        publishedAt: json["publishedAt"],
        updatedAt: json["updatedAt"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "url": url,
        "title": title,
        "content": content,
        "image": image,
        "thumbnail": thumbnail,
        "status": status,
        "category": category,
        "publishedAt": publishedAt,
        "updatedAt": updatedAt,
        "userId": userId,
      };
}
