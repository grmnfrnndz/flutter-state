import 'package:flutter/material.dart';

import 'package:estados_app/src/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (BuildContext context) => Pagina1Page(),
        'pagina2': (BuildContext context) => Pagina2Page(),
      },
    );
  }
}