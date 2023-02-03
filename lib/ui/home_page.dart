import 'package:bloc_pattern_api/data/repositories/food_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pizza_bloc_bloc.dart';
import '../widgets/error.dart';
import '../widgets/list.dart';
import '../widgets/loading.dart';
import '../widgets/button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PizzaBlocBloc>(
          create: (BuildContext context) => PizzaBlocBloc(FoodRepositoryImpl()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('The BloC App')),
        body: BlocProvider(
          create: (context) => PizzaBlocBloc(FoodRepositoryImpl()),
          child: BlocBuilder<PizzaBlocBloc, PizzaBlocState>(
              builder: (context, state) {
            if (state is PizzaBlocinital) {
              return fetchButton(context);
            } else if (state is PizzaBlocLoading) {
              return buildLoading();
            } else if (state is PizzaBlocLoaded) {
              return buildHintsList(state.recipes);
            } else if (state is PizzaBlocError) {
              return buildError(state.error);
            } else {
              return buildLoading();
            }
          }),
        ),
      ),
    );
  }
}
