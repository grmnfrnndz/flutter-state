import 'package:estados_app/src/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pagina 1')),
        actions: [
          IconButton(onPressed: () => usuarioCubit.removerUsuario()
          , icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: BodyScaffold(),
     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.pushNamed(context, 'pagina2'),
       child: Icon(Icons.skip_next),
     ),
   );
  }
}

class BodyScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {





    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {  
        // print(state);

        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No hay usuario disponible.'));

          case UsuarioActivo:
            return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
            
          default:
            return Center(child: Text('Estado no reconocido'));
        }

        // if (state is UsuarioInitial) {
        //   return Center(child: Text('No hay usuario disponible.'));
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(usuario: state.usuario);
        // } else {
        //   return Center(child: Text('Estado no reconocido'));
        // }

      },
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
          // ListTile(title: Text('Profesión 1: ')), 
    
          ...usuario.profesiones.map((profesion) => ListTile(title: Text('Profesión: ${profesion}'))).toList()
    
    
           
        ],
      ),
    );
  }
}