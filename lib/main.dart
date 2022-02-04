import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu/page/home.dart';
import 'package:menu/page/page.dart';
import 'package:menu/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);//le cambiamos el color del status bar

    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: ( _ ) => AuthServices(),),
        ChangeNotifierProvider(create: ( _ ) => ProductServices(),)
      ],
      child: AppMovil(),
      );
  }
}

class AppMovil extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'Home',
      routes: {
        'Login':    ( _ ) => Login(),
        'Home':     ( _ ) => Home(),
        'Register': ( _ ) => Register(),
        'Products': ( _ ) => Products(),
        'ProductDetail': ( _ ) => ProductDetail(),

      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          color: Colors.indigo,
          elevation: 0,
          centerTitle: true
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: Colors.indigo
        )
      ),
    );
  }
}
