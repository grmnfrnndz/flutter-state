import 'package:estados_app/src/models/models.dart';
import 'package:estados_app/src/services/usuario_service.dart';
import 'package:flutter/material.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pagina 1')),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {

          return snapshot.hasData
          ? InformacionUsuario(usuario: snapshot.data!)
          : Center(child: Text('No hay información de usuario'));

        },
      ),
       

     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushNamed(context, 'pagina2'),
       child: Icon(Icons.skip_next),
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({Key? key, 
  required this.usuario}) : super(key: key);

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
          ListTile(title: Text('Profesión 1: ')), 
          ListTile(title: Text('Profesión 2: ')), 
        ],
      ),
    );
  }
}