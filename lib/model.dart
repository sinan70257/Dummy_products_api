import 'dart:convert';

import 'package:http/http.dart' as http;

class products {
  int? id;
  bool fav = false;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  products(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  factory products.fromJson(Map<String, dynamic> json) {
    return products(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: json['images'].cast<String>(),
    );
  }
}

Future<List<products>> fetchdata() async {
  final response = await http.get(Uri.parse("https://dummyjson.com/products"));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)["products"];
    List<products> result = data.map((e) => products.fromJson(e)).toList();
    return result;
  } else {
    throw Exception("Failed to fetch");
  }
}
