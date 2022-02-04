import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: 20,vertical:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lorem inpsu',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Irure datat labore ullamco in ea.',style: TextStyle(fontSize: 16,color: Colors.white),maxLines: 2,),
          ],
        ),
      ),
    );
  }
}