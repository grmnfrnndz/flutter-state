

part of 'user_bloc.dart';

@immutable
abstract class UserState {

final bool existuser;
final Usuario? user;

  const UserState({
    this.existuser = false, 
    this.user
    });


}


class UserInitialState extends UserState {

  const UserInitialState(): super(existuser: false, user: null);

}


class UserSetState extends UserState {

  final Usuario newUser;
  const UserSetState(this.newUser):super(existuser: true, user: newUser);

}




