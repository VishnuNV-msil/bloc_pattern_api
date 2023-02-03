
part of 'pizza_bloc_bloc.dart';

abstract class PizzaBlocEvent extends Equatable {
  const PizzaBlocEvent();
}

class FetchFoodEvent extends PizzaBlocEvent {
  @override
  List<Object> get props => [];
}
class ButtonPressEvent extends PizzaBlocEvent {
@override
  List<Object> get props => [];
}
