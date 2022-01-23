import 'package:flutter/material.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

            }),
            MaterialButton(
              child: Text('Establecer Edad', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

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