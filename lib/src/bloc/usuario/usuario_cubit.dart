import 'package:estados_app/src/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario usuario) {
    emit(UsuarioActivo(usuario));
  }

  void cambiarEdad(int edad) {

    final currentState = state;

    if (currentState is UsuarioActivo) {
      final usuario = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(usuario));
    }

  }

  void agregarProfesion() {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      final profesiones = [
        ...currentState.usuario.profesiones,
        'Profesion: ${currentState.usuario.profesiones.length + 1}'
      ];
      final usuario = currentState.usuario.copyWith(profesiones: profesiones);
      
      emit(UsuarioActivo(usuario));
    }
  }


  void removerUsuario() {
    emit(UsuarioInitial());
  }

}
