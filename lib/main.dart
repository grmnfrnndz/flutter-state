import 'package:estados_app/src/services/services.dart';
import 'package:flutter/material.dart';

import 'package:estados_app/src/pages/pages.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UsuarioService()),
    ],
    child: MyApp(),
    );
  }
}

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