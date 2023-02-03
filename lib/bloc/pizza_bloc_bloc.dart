import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_api/data/model/food.dart';
import 'package:equatable/equatable.dart';
import '../data/repositories/food_repository.dart';

part 'pizza_bloc_event.dart';
part 'pizza_bloc_state.dart';

class PizzaBlocBloc extends Bloc<PizzaBlocEvent, PizzaBlocState> {
  final FoodRepository _repository;

  PizzaBlocBloc(this._repository) : super(PizzaBlocinital()) {
    on<FetchFoodEvent>((event, emit) async {
      emit(PizzaBlocLoading());
      try {
        final recipes = await _repository.getFoods();
        emit(PizzaBlocLoaded(recipes));
      } catch (error) {
        emit(PizzaBlocError(error.toString()));
      }
    });
  }
}
