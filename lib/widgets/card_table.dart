import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SingleCard(available:false,color:Colors.blue, icon: Icons.tab_rounded, text:'General'),
            _SingleCard(available:false,color:Colors.red, icon: Icons.offline_bolt_outlined, text:'Otros'),
          ] 
        ),
        TableRow(
          children: [
            GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, 'Products'),
            child: _SingleCard(available:true,color:Colors.pinkAccent, icon: Icons.apps, text:'Productos')),
            _SingleCard(available:false,color:Colors.green, icon: Icons.calendar_today_outlined, text:'Calendario'),
          ] 
        ),
        TableRow(
          children: [
            _SingleCard(available:false,color:Colors.deepOrange, icon: Icons.shop, text:'Compras'),
            _SingleCard(available:false,color:Colors.purpleAccent, icon: Icons.cloud, text:'Nube'),
          ] 
        ),
        TableRow(
          children: [
            _SingleCard(available:false,color:Colors.purple, icon: Icons.event_available, text:'Evento'),
            _SingleCard(available:false,color:Colors.blueAccent, icon: Icons.mail_sharp, text:'Correo'),
          ] 
        ),
        
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {

  final Color color;
  final IconData icon;
  final String text;
  final bool available;

  const _SingleCard({Key? key, required this.color, required this.icon,required this.text, required this.available}) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 180,
      decoration: BoxDecoration(
        color: Color.fromRGBO(62,66, 107, 0.5),
        borderRadius:BorderRadius.circular(20),
       ),
      //margin:EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            child:Icon(icon,size: 25,),
            radius: 20,
          ),
          SizedBox(height: 10,),
          Text(text,style: TextStyle(fontSize: 18,color: color),),
          Text(available? 'Diponible':'No Disponible',style: TextStyle(fontSize: 10,color: Colors.white),)
        ],
      ),
    );
  }
}