

class Usuario {

  static const List<String> defaultValue = [];

  // la edad no se guarda, lo normal es calcular con las fecha de nacimiento
  String nombre;
  int edad;
  List<String> profesiones;

  

  Usuario({
    required this.nombre, 
    required this.edad, 
    this.profesiones=defaultValue});

    // :assert(nombre != null) fuerza un error

}