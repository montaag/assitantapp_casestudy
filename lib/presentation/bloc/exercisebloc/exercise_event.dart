part of 'exercise_bloc.dart';

sealed class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}

class GetExercise extends ExerciseEvent {
  const GetExercise();
}

class FilterExercise extends ExerciseEvent {
  final String? name;
  final List<String>? muscleList;
  final String? type;

  const FilterExercise({this.name, this.muscleList, this.type});
}

class ClearFilter extends ExerciseEvent {}
