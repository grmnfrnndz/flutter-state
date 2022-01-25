import 'package:estados_app/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados_app/src/services/services.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: (usuarioService.existeUsuario)
        ? Text('${usuarioService.usuario.nombre}')
        : Text('pagina 2')
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

                final usuario = Usuario(nombre: 'German', edad: 34, profesiones: ['amigo', 'corazon', 'risas', 'alegria']);
                usuarioService.usuario = usuario;

            }),
            MaterialButton(
              child: Text('Establecer Edad', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed:(usuarioService.existeUsuario) 
              ? (){
                  usuarioService.cambiarEdad(40);
              } 
            : () {}
            ),
            MaterialButton(
              child: Text('Agregar Una Profesión', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (usuarioService.existeUsuario) 
              ? (){
                  usuarioService.agregarProfesion('simpatico');
              } 
            : () {}
            ),
          ],
        )
     ),
   );
  }
}