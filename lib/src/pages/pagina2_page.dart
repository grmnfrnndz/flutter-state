import 'package:estados_app/src/models/models.dart';
import 'package:estados_app/src/services/usuario_service.dart';
import 'package:flutter/material.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {

          return snapshot.hasData
          ? Center(child: Text('${snapshot.data!.nombre}') )
          : Center(child: Text('Page 2'));

        }
      )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

                final nuevoUsuario = Usuario(
                  nombre: 'Fernándo',
                  edad: 34,
                );
                usuarioService.cargarUsuario(nuevoUsuario);

            }),
            MaterialButton(
              child: Text('Establecer Edad', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                usuarioService.cambiarEdad(35);
            }),
            MaterialButton(
              child: Text('Agregar Una Profesión', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

            }),
          ],
        )
     ),
   );
  }
}