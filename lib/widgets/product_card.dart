import 'package:flutter/material.dart';
import 'package:menu/models/models.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({
    Key? key,
    required this.product
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 30,bottom: 50),
        width: 400,
        height: 300,
        decoration: _card_border(),
        child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CardBackground(product.picture!),
          productDetail(product.name),
          Positioned(
            top: 0,
            right: 0,
            child: PriceTag(product.price)
          ),
          if(!product.available)
            Positioned(
              top: 0,
              left: 0,
              child: Available()
            ),
        ]
        ),
      ),
    );
  }

  BoxDecoration _card_border() => BoxDecoration(
    borderRadius:BorderRadius.circular(25),
    color: Colors.white,
    boxShadow:[
      BoxShadow(
        blurRadius: 10,
        offset: Offset(0,7),
        color: Colors.black12,
      )
    ] 

  );
}

class Available extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomRight: Radius.circular(25))
        ), 
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('No Disponible',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
      ),
      );
  }
}

class PriceTag extends StatelessWidget {
 
 final int price;

  const PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('\L$price',style: TextStyle(color: Colors.white,fontSize: 20),)),
      ),
      decoration: BoxDecoration(
        color:Colors.indigo,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topRight: Radius.circular(25)) 
      ),
    );
  }
}

class productDetail extends StatelessWidget {

  final String name;

  const productDetail(this.name);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        width: double.infinity,
        height: 50,
        decoration: borderProductDetail(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
            style: TextStyle(color: Colors.white,fontSize: 20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
    
      ),
    );
  }

  BoxDecoration borderProductDetail() => BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topRight: Radius.circular(25))
    );
}

class CardBackground extends StatelessWidget {

  final String url;

  const CardBackground(this.url);


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 300,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}