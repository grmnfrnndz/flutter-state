import 'package:flutter/material.dart';
import 'package:estados_app/src/models/models.dart';


class UsuarioService with ChangeNotifier {

  Usuario? _usuario;

  Usuario get usuario => _usuario!;

  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(Usuario usuario) {
    _usuario = usuario;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
    notifyListeners();
  }

  void removerUsuario(){
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion(String profesion) {
    _usuario!.profesiones.add(profesion);
    notifyListeners();
  }

}