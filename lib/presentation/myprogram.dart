import 'package:casestudey_assistantapp/domain/models/categories.dart';
import 'package:casestudey_assistantapp/domain/models/exercise.dart';
import 'package:casestudey_assistantapp/presentation/bloc/bloc/category_bloc.dart';
import 'package:casestudey_assistantapp/presentation/bloc/exercisebloc/exercise_bloc.dart';
import 'package:casestudey_assistantapp/presentation/new_category.dart';
import 'package:casestudey_assistantapp/presentation/widgets/custom_chip.dart';
import 'package:casestudey_assistantapp/presentation/widgets/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProgramView extends StatefulWidget {
  const MyProgramView({super.key});

  @override
  State<MyProgramView> createState() => _MyProgramViewState();
}

class _MyProgramViewState extends State<MyProgramView> {
  CategoryModel? selectedCategory;
  @override
  void initState() {
    super.initState();
    selectedCategory = context.read<CategoryBloc>().state.categories.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Program"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(context: context, isScrollControlled: true, useSafeArea: true, builder: (context) => NewCategoryView());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state.categories.isEmpty) {
                return const Center(
                  child: Text("No Category"),
                );
              } else {
                return SizedBox(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.categories
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = e;
                                  });
                                  context.read<ExerciseBloc>().add(GetExercise());
                                },
                                child: CustomChip(
                                  text: e.name,
                                  isOutlined: selectedCategory == e ? false : true,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, categoryState) {
                return BlocBuilder<ExerciseBloc, ExerciseState>(
                  builder: (context, state) {
                    List<ExerciseModel> exercise =
                        selectedCategory == null ? [] : state.exerciseList.where((element) => selectedCategory!.exerciseID.contains(element.name)).toList();
                    return SingleChildScrollView(
                      child: Column(
                        children: exercise
                            .map((e) => ExerciseCard(
                                  exerciseModel: e,
                                  isSlideable: true,
                                  onPress: () {
                                    context.read<CategoryBloc>().add(RemoveCategory(selectedCategory!, e.name));
                                    setState(() {});
                                  },
                                ))
                            .toList(),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
