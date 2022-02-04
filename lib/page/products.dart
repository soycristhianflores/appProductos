import 'package:flutter/material.dart';
import 'package:menu/models/models.dart';
import 'package:menu/page/page.dart';
import 'package:menu/services/services.dart';
import 'package:menu/widgets/widgets.dart';
import 'package:provider/provider.dart';


class Products extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductServices>(context);

    if(productsService.isLoading) return loadingProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: productsService.Products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
             productsService.selectedProduct = productsService.Products[index].copy();
             Navigator.pushNamed(context, 'ProductDetail');
          },
          child: ProductCard(product: productsService.Products[index])),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        ),
    );
  }
}