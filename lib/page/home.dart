import 'package:flutter/material.dart';
import 'package:menu/widgets/background.dart';
import 'package:menu/widgets/bottom_navigate.dart';
import 'package:menu/widgets/card_table.dart';
import 'package:menu/widgets/home_title.dart';

class Home extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Background(),
           _HomeBody()

      ],),
      bottomNavigationBar: Navigate(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeTitle(),
          CardTable(),
          
        ],
      ),
    );
  }
}
