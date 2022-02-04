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
    print(this.product.name);
    print(this.product.available);

    return formKey.currentState?.validate()?? false;
  }

}