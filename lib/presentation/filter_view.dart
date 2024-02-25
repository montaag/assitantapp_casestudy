import 'package:casestudey_assistantapp/presentation/bloc/exercisebloc/exercise_bloc.dart';
import 'package:casestudey_assistantapp/presentation/widgets/custom_button.dart';
import 'package:casestudey_assistantapp/presentation/widgets/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  List<String> selectedMuscles = [];
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Search by muscle",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          BlocBuilder<ExerciseBloc, ExerciseState>(
            builder: (context, state) {
              List<String> muscles = [];
              for (var element in state.exerciseList) {
                if (!muscles.contains(element.muscle)) {
                  muscles.add(element.muscle);
                }
              }

              return Wrap(
                children: muscles.map(
                  (e) {
                    bool isSelected = false;
                    if (selectedMuscles.contains(e)) {
                      isSelected = true;
                    }
                    return GestureDetector(
                        onTap: () {
                          if (!selectedMuscles.contains(e)) {
                            selectedMuscles.add(e);
                            setState(() {});
                          } else {
                            selectedMuscles.removeWhere((element) => element == e);
                            setState(() {});
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                          child: CustomChip(
                            text: e,
                            isOutlined: !isSelected,
                          ),
                        ));
                  },
                ).toList(),
              );
            },
          ),
          Spacer(),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Search by type",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          BlocBuilder<ExerciseBloc, ExerciseState>(
            builder: (context, state) {
              List<String> types = [];
              for (var element in state.exerciseList) {
                if (!types.contains(element.type)) {
                  types.add(element.type);
                }
              }

              return Wrap(
                children: types.map((e) {
                  bool isOutlined = false;
                  if (selectedType == e) {
                    isOutlined = true;
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedType = e;
                        });
                      },
                      child: CustomChip(
                        isOutlined: !isOutlined,
                        text: e,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: "Clear",
                  buttonType: CustomButtonType.secondary,
                  onPressed: () {
                    selectedMuscles.clear();
                    setState(() {
                      selectedType = null;
                    });

                    context.read<ExerciseBloc>().add(ClearFilter());
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  title: "Filter",
                  buttonType: CustomButtonType.primary,
                  onPressed: () {
                    context.read<ExerciseBloc>().add(FilterExercise(type: selectedType, muscleList: selectedMuscles));
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
