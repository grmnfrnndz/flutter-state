import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:estados_app/src/models/models.dart';

part 'user_event.dart';
part 'user_state.dart';




class UserBloc extends Bloc<UserEvent, UserState> {
  
  UserBloc() : super(const UserInitialState()){

    on<ActivateUser>( (event, emit) => emit(UserSetState(event.user)));

    on<DeleteUser>( (event, emit) => emit(UserInitialState()));

    on<ChangeUserAge>( (event, emit) { 

        if (!state.existuser) return ;

      // la variable state existe a nivel global en el bloc
      final usuario = state.user!.copyWith(edad: event.age);
      emit(UserSetState(usuario));

    });

    on<AddProfesion>( (event, emit) { 

        if (!state.existuser) return ;

      final profesiones = state.user!.profesiones;
      profesiones.add(event.profesion);

      final usuario = state.user!.copyWith(profesiones: profesiones);
      emit(UserSetState(usuario));

    });



  }

}
