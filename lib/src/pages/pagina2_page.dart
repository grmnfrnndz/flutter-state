import 'package:estados_app/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/src/bloc/user/user_bloc.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

                final user = Usuario(nombre: 'German', edad: 34, profesiones: ['Developer']);
                userBloc.add(ActivateUser(user));


            }),
            MaterialButton(
              child: Text('Establecer Edad', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

                userBloc.add(ChangeUserAge(35));

            }),
            MaterialButton(
              child: Text('Agregar Una Profesión', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

              userBloc.add(AddProfesion('Ingeniero'));

            }),
          ],
        )
     ),
   );
  }
}