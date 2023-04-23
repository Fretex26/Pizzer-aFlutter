import 'package:flutter/material.dart';
import './../components/text_field.dart';
import '../components/custom_button.dart';
import './../components/custom_alert.dart';

class LoginPage extends StatelessWidget {

  final userFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment : MainAxisAlignment.start,
                children: [
              
                  const SizedBox(height: 50.0,),
              
                  const Icon(
                    Icons.local_pizza,
                    size: 160.0,
                    color: Color.fromARGB(255, 140, 3, 3),
                  ),
              
                  const SizedBox(height: 50.0,),
              
                  Text(
                    'Bienvenido a Hola Pizza',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey.shade700,
                    ),
                  ),
              
                  const SizedBox(height: 50.0,),
              
                  ATextField(
                    controller: userFieldController,
                    textBack: 'Usuario',
                    isPassword: false,
                    color: const Color.fromARGB(255, 255, 223, 184),
                  ),
              
                  const SizedBox(height: 10.0,),
              
                  ATextField(
                    controller: passwordFieldController,
                    textBack: 'Contraseña',
                    isPassword: true,
                    color: const Color.fromARGB(255, 255, 223, 184),
                  ),
              
                  const SizedBox(height: 10.0,),
              
                  Text(
                    'Olvidé mi contraseña',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 50.0,),

                  CustomButton(
                    action: () {
                      if (userFieldController.text.trim() == 'flutter' && passwordFieldController.text.trim() == 'pizza') {
                        Navigator.pushNamed(context, '/order');
                      } else{
                        showAlert(context, 'Verifica tus credenciales por favor');
                      }
                    },
                    text: 'Entrar'
                  ),

                  const SizedBox(height: 50.0,),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}