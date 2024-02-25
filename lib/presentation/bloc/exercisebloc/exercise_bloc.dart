import 'package:bloc/bloc.dart';
import 'package:casestudey_assistantapp/data/repositories/exercise_repo.dart';
import 'package:casestudey_assistantapp/domain/models/errors.dart';
import 'package:casestudey_assistantapp/domain/models/exercise.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepo repo;

  ExerciseBloc(this.repo) : super(const ExerciseInitial([], [])) {
    on<GetExercise>((event, emit) async {
      emit(ExerciseLoading(state.exerciseList, state.filteredList));

      await repo.getExerciseList().fold(
          (left) => emit(
                Failure(state.exerciseList, state.filteredList, error: CustomException.now(message: left.error)),
              ),
          (right) => emit(ExerciseLoaded(right, right)));
    });
    on<FilterExercise>((event, emit) {
      List<ExerciseModel> original = List<ExerciseModel>.from(state.exerciseList);

      List<ExerciseModel> newFilteredList = [];
      if (event.name != null) {
        if (event.name == "") {
          newFilteredList = state.exerciseList;
        } else {
          for (var element in original) {
            if (element.name.toLowerCase().contains(event.name!.toLowerCase())) {
              newFilteredList.add(element);
            }
          }
        }
      }

      if (event.type != null && event.muscleList != null) {
        for (var element in original) {
          if (element.type == event.type && event.muscleList!.contains(element.muscle)) {
            newFilteredList.add(element);
          }
        }
      } else {
        if (event.type != null) {
          for (var element in original) {
            if (element.type == event.type) {
              newFilteredList.add(element);
            }
          }
        }
        if (event.muscleList != null) {
          for (var element in original) {
            if (event.muscleList!.contains(element.muscle)) {
              newFilteredList.add(element);
            }
          }
        }
      }

      emit(ExerciseLoaded(state.exerciseList, newFilteredList));
    });

    on<ClearFilter>((event, emit) async {
      emit(ExerciseLoaded(state.exerciseList, state.exerciseList));
    });
  }
}
