 import 'package:flutter/material.dart';

 class loadingProducts extends StatelessWidget {
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
        title: Text('Productos'),
      ),
      body: Center(child: CircularProgressIndicator(),),
     );
   }
 }