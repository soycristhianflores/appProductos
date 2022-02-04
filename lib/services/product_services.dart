

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:menu/models/models.dart';
import 'package:http/http.dart' as http;

class ProductServices extends ChangeNotifier {
  
  final String baseUrl = 'appstore-e5ec8-default-rtdb.firebaseio.com';
  final List<Product> Products = [];
  late Product selectedProduct;

  bool isLoading = true;
  bool isSaving = false;

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


  }

  Future saveOrCreateProduct(Product product) async{
    isSaving = true;
    notifyListeners();

    if(product == null){
      //crear product
    }else{
      await this.updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async{
    final url = Uri.https(baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());

    final decodeData = resp.body;

    final index = this.Products.indexWhere((element) => element.id == product.id);
    this.Products[index] = product;

    print(decodeData);

    return product.id!;
  }




}