import 'package:casestudey_assistantapp/domain/models/exercise.dart';
import 'package:casestudey_assistantapp/presentation/bloc/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCategory extends StatefulWidget {
  final ExerciseModel exerciseModel;

  const SelectCategory({super.key, required this.exerciseModel});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: state.categories
                .map((e) => ListTile(
                      title: Text(e.name),
                      onTap: () {
                        context.read<CategoryBloc>().add(AddExerciseToCategory(widget.exerciseModel, e));
                        Navigator.pop(context);
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
