import "package:json_annotation/json_annotation.dart";

part 'product.g.dart';

@JsonSerializable()
class Product {
  String title;
  List<String> images;
  double price;

  Product({
    required this.title,
    required this.images,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductToJson(this);
  }
}
