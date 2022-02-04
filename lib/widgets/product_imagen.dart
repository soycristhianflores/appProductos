import 'package:flutter/material.dart';

class ProductDetailImg extends StatelessWidget {

  final String? url;

  const ProductDetailImg({Key? key, this.url}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 400,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(45),topRight: Radius.circular(45)),
          child: this.url == null
            ? Image(
            image:AssetImage('assets/no-image.png'),
            fit: BoxFit.cover,
            )
            : FadeInImage(
            image: NetworkImage(this.url!),
            placeholder: AssetImage('assets/jar-loading.gif'), 
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(45),topRight: Radius.circular(45)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset:Offset(0,5) 
        )
    ] 
  );
}