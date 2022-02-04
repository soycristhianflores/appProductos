import 'package:flutter/material.dart';
import 'package:menu/models/models.dart';
import 'package:provider/provider.dart';

class ProductFormProvider extends  ChangeNotifier {

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);


  updateAvailable(bool value){
    this.product.available = value;
    notifyListeners();

  }

  bool isValidForm(){
    return formKey.currentState?.validate()?? false;
  }

}