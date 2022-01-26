import 'package:estados_app/src/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

                final usuario = Usuario(nombre: 'german', edad: 34);
                usuarioCubit.seleccionarUsuario(usuario);
                

            }),
            MaterialButton(
              child: Text('Establecer Edad', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
              usuarioCubit.cambiarEdad(40);

            }),
            MaterialButton(
              child: Text('Agregar Una Profesión', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                usuarioCubit.agregarProfesion();

            }),
          ],
        )
     ),
   );
  }
}