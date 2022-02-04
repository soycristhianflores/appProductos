import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {

  final child;

  const CardContainer(@required this.child);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: Card(),
        child: child,
      ),
    );
  }

  BoxDecoration Card() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,5),
      )
    ]
  );
}