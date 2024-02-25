// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:casestudey_assistantapp/presentation/bloc/exercisebloc/exercise_bloc.dart';
import 'package:casestudey_assistantapp/presentation/filter_view.dart';
import 'package:casestudey_assistantapp/presentation/widgets/cusotm_alert_dialog.dart';
import 'package:casestudey_assistantapp/presentation/widgets/custom_textfield.dart';
import 'package:casestudey_assistantapp/presentation/widgets/exerciseListview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    context.read<ExerciseBloc>().add(GetExercise());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExerciseBloc, ExerciseState>(
      listener: (context, state) {
        if (state is Failure) {
          showCustomDialog(context, CustomAlert(title: "Hata", description: state.error.message));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormFiled(
                      hintText: "Search",
                      onChanged: (value) {
                        context.read<ExerciseBloc>().add(FilterExercise(name: value));
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          showDragHandle: true,
                          isScrollControlled: true,
                          useSafeArea: true,
                          builder: (context) => FilterView(),
                        );
                      },
                      icon: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.tune,
                              color: Colors.white,
                            ),
                          )))
                ],
              ),
            ),
            BlocBuilder<ExerciseBloc, ExerciseState>(
              builder: (context, state) {
                return state is ExerciseLoaded
                    ? Text(
                        state.exerciseList.length.toString() + " results found.",
                        style: const TextStyle(color: Colors.grey),
                      )
                    : Container();
              },
            ),
            const SizedBox(height: 12),
            ExerciseListView(),
          ],
        ),
      ),
    );
  }
}
