
import 'package:flutter/material.dart';
import '../bloc/pizza_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget fetchButton(BuildContext context) {
  return Center(
    child: ElevatedButton(
              onPressed: () {
                 BlocProvider.of<PizzaBlocBloc>(context).add(FetchFoodEvent());

              },
              child: Text('fetch api'),
            ),
  );
}