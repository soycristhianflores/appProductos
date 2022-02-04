

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:menu/models/models.dart';
import 'package:http/http.dart' as http;

class ProductServices extends ChangeNotifier {
  
  final String baseUrl = 'appstore-e5ec8-default-rtdb.firebaseio.com';
  final List<Product> Products = [];
  late Product selectedProduct;

  bool isLoading = true;

  ProductServices(){
    this.loadProducts();
  }

  Future loadProducts() async{

    isLoading = true;
    notifyListeners();

    final url = Uri.https(baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String,dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key,value){

        final tempProduct = Product.fromMap(value);
        tempProduct.id = key;
        this.Products.add(tempProduct);


    });
    
    isLoading = false;
    notifyListeners();

    print(this.Products[0].name);

  }


}