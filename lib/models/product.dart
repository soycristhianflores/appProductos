// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

import 'package:menu/page/page.dart';

class Product {
    Product({
        required this.amount,
        required this.available,
        required this.name,
        this.picture,
        required this.price,
        this.id
    });

    int amount;
    bool available;
    String name;
    String? picture;
    int price;
    String? id;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        amount: json["amount"],
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"],
    );

    Map<String, dynamic> toMap() => {
        "amount": amount,
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
    };

    Product copy()=> Product(
      amount: this.amount,
      available: this.available,
      name: this.name,
      picture: this.picture,
      price: this.price,
      id: this.id,
    );
}
