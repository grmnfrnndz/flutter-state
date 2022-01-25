import 'package:estados_app/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados_app/src/services/services.dart';

class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: (usuarioService.existeUsuario)
        ? Text('${usuarioService.usuario.nombre}')
        : Text('pagina 1')
        ),
        actions: [
          IconButton(onPressed: (usuarioService.existeUsuario) 
              ? (){
                  usuarioService.removerUsuario();
              } 
            : () {}, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: (usuarioService.existeUsuario ) ? InformacionUsuario(usuario: usuarioService.usuario) : Center(child: Text('No se ha definido el usuario')),
     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushNamed(context, 'pagina2'),
       child: Icon(Icons.skip_next),
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  InformacionUsuario({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')), 
          ListTile(title: Text('Edad: ${usuario.edad}')), 
          
          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          
          // ListTile(title: Text('Profesión 1: ')), 
          // los puntos ... se agregan para agregarlos a la lista
          // destructuracion de un elemento
          ...usuario.profesiones.map((x) => ListTile(title: Text('Profesión: ${x}'))).toList(),

        ],
      ),
    );
  }
}