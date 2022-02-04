import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final child;

  const AuthBackground( @required this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child:Stack(
        children: [
          BackgroundTop(),
          IconTop(),
          this.child,
        ],
      ),
    );
  }
}

class IconTop extends StatelessWidget {
  const IconTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Icon(Icons.person_pin,size: 100,color: Colors.white,),
    ));
  }
}


class BackgroundTop extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      decoration: _BoxDecoration(),
    );
  }

  BoxDecoration _BoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors:[
        Color(0xff2E305F),
        Color(0xff202333),
      ] )
  );
}