import 'package:casestudey_assistantapp/presentation/bloc/exercisebloc/exercise_bloc.dart';
import 'package:casestudey_assistantapp/presentation/widgets/customLoading.dart';
import 'package:casestudey_assistantapp/presentation/widgets/exercise_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseListView extends StatelessWidget {
  const ExerciseListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        return state is ExerciseLoaded
            ? Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: state.filteredList.map((e) => ExerciseCard(exerciseModel: e)).toList(),
                  ),
                ),
              )
            : state is ExerciseLoading
                ? Expanded(child: CustomLoadingScreen())
                : Container();
      },
    );
  }
}
