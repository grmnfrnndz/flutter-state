

class Usuario {

  static const List<String> defaultValue = [];

  // la edad no se guarda, lo normal es calcular con las fecha de nacimiento
  final String nombre;
  final int edad;
  final List<String> profesiones;

  

  Usuario({
    required this.nombre, 
    required this.edad, 
    this.profesiones=defaultValue});


  Usuario copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones
  }) => Usuario(
    nombre: nombre ?? this.nombre, 
    edad: edad ?? this.edad,
    profesiones: profesiones ?? this.profesiones
  );



}