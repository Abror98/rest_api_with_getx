// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';
List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.name,
    this.manufacturer,
    this.productCode,
    this.sum,
    this.priceInclude,
    this.availability,
    this.image,
    this.color,
    this.status,
  });

  String name;
  String manufacturer;
  String productCode;
  double sum;
  String priceInclude;
  int availability;
  String image;
  String color;
  bool status;
  var isFavorite = false.obs;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    manufacturer: json["manufacturer"],
    productCode: json["productCode"],
    sum: json["sum"].toDouble(),
    priceInclude: json["priceInclude"],
    availability: json["availability"],
    image: json["image"],
    color: json["color"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "manufacturer": manufacturer,
    "productCode": productCode,
    "sum": sum,
    "priceInclude": priceInclude,
    "availability": availability,
    "image": image,
    "color": color,
    "status": status,
  };
}
