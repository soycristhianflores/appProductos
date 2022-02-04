
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu/models/models.dart';
import 'package:menu/provider/product_form.dart';
import 'package:menu/services/services.dart';
import 'package:menu/widgets/widgets.dart';
import 'package:provider/provider.dart';


class ProductDetail extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  final productsService = Provider.of<ProductServices>(context);

  return ChangeNotifierProvider(
    create: (_)=> ProductFormProvider(productsService.selectedProduct),
    child: _ProductDetail(productsService: productsService),
    );

  }
}

class _ProductDetail extends StatelessWidget {
  const _ProductDetail({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  final ProductServices productsService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductDetailImg(url:productsService.selectedProduct.picture),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: ()=> Navigator.of(context).pop(), 
                    icon: Icon(Icons.arrow_back_ios_new,size:40,color: Colors.white),
                    ) 
                  ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: ()=> Navigator.of(context).pop(), 
                    icon: Icon(Icons.camera_alt_outlined,size:40,color: Colors.white),
                    ) 
                  ),
              ],
            ),
            _ProductForm(),
            SizedBox(height: 50,)
          ],
        ),),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save_outlined),
          onPressed: () async{
            if(!productForm.isValidForm()) return;
            await productsService.saveOrCreateProduct(productForm.product);
          },
          ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ProductForm = Provider.of<ProductFormProvider>(context);
    final product = ProductForm.product;


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        decoration: _boxDecoration(),
        child:Form(
          key: ProductForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                initialValue: product.name,
                onChanged: (value)=> product.name = value,
                validator: (value){
                  if(value == null || value.length < 1)
                  return 'El nombre es obligatorio';
                },
                decoration: InputDecoration(
                  labelText:"Nombre:",
                  hintText: "Nombre del Producto" 
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                initialValue: '${product.price}',
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))],
                onChanged: (value) {
                  if(double.tryParse(value) == null){
                    product.price = 0;
                  }else{
                    product.price = int.parse(value);
                  }
                }, 
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:"Precio:",
                  hintText: "\$150" 
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                initialValue: "${product.amount}",
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))],
                onChanged: (value) {
                  double.tryParse(value) == null?
                  product.amount = 0:
                  product.amount = int.parse(value);
                }, 
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:"Cantidad:",
                  hintText: "1" 
                ),
              ),
              SizedBox(height: 30,),
              SwitchListTile(
                title: Text("Disponible"),
                activeColor: Colors.indigo,
                value: product.available, 
                onChanged: (value){
                  ProductForm.updateAvailable(value);  
                }),
              SizedBox(height: 30,),

            ],
          ),
        )
      )
      );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight: Radius.circular(25)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset:Offset(0,5) 
        )
    ]
  );
}