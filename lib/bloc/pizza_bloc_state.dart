part of 'pizza_bloc_bloc.dart';

abstract class PizzaBlocState extends Equatable {
  //const PizzaBlocState();
}
class PizzaBlocinital extends PizzaBlocState {
  @override
  List<Object> get props => [];
}

class PizzaBlocLoading extends PizzaBlocState {
  @override
  List<Object> get props => [];
}

class PizzaBlocLoaded extends PizzaBlocState {
  final List<Recipe> recipes;
  PizzaBlocLoaded(this.recipes);
  @override
  List<Object?> get props => [recipes];
}

class PizzaBlocError extends PizzaBlocState {
  final String error;
  PizzaBlocError(this.error);
  @override
  List<Object?> get props => [error];
}
