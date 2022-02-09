import 'package:estados_app/src/bloc/user/user_bloc.dart';
import 'package:estados_app/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pagina 1')),
        actions: [
          IconButton(onPressed: () { 

            BlocProvider.of<UserBloc>(context, listen:false).add(DeleteUser());

           }, icon: Icon(Icons.exit_to_app_outlined),

          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existuser
          ? InformacionUsuario(usuario: state.user!)
          : Center(
            child: Text('No existe usuario seleccionado.'),
          );  
          
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

  const InformacionUsuario({Key? key, required this.usuario}) : super(key: key);

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

          ...usuario.profesiones.map((e) => ListTile(title: Text('Profesión: ${e}'))).toList()
        ],
      ),
    );
  }
}