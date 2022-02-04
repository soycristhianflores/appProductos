import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu/provider/login_provider.dart';
import 'package:menu/services/services.dart';
import 'package:menu/style/input_decorations.dart';
import 'package:menu/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250,),
              CardContainer(
                Column(
                  children: [
                   Text('Login',style: TextStyle(fontSize: 20),),
                   ChangeNotifierProvider(create: ( _ )=> LoginFormProvider(),
                   child: _Form(),
                   )   
                ],)
              ),
            
            SizedBox(height: 20,),
            TextButton(onPressed: () => Navigator.pushReplacementNamed(context, 'Register'), 
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
            child: Text('Crear una nueva cuenta',style: TextStyle(color: Colors.black87),),
            ),
            SizedBox(height: 20,),
            ],
          ),
        )
      ),
    );
  }
}


class _Form extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child:Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration('Correo Electronico','floresdata22@gmail.com',Icons.alternate_email_sharp),
              onChanged: (value) => loginForm.email = value,
              validator: (value){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                ? null : 'El valor ingresado no es valido';
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration('******','Contraseña',Icons.lock_outline),
              onChanged: (value) => loginForm.password = value,
              validator: (value){
                return (value != null && value.length >= 6)
                ? null : 'Contraseña invalida';
              },
            ),
            SizedBox(height: 20.0),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                child: Text(
                  (loginForm.isLoading) ?
                  'Espere por favor...' :
                  'Ingresar',
                  style: TextStyle(color: Colors.white),),
              ),
              onPressed: loginForm.isLoading ? null : () async{
                FocusScope.of(context).unfocus();

                final authServices = Provider.of<AuthServices>(context,listen: false);

                if(!loginForm.isValindForm()) return ;
                loginForm.isLoading = true;


                final String? responToken = await authServices.login(loginForm.email, loginForm.password);                

                if(responToken == null){
                  Navigator.pushReplacementNamed(context, 'Home');
                }else{
                  print(responToken);
                  loginForm.isLoading = false;
                }

              }
            )
          ],
        )

      ),
    );
  }
}