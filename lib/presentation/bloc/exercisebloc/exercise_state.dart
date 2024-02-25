part of 'exercise_bloc.dart';

sealed class ExerciseState extends Equatable {
  final List<ExerciseModel> exerciseList;
  final List<ExerciseModel> filteredList;
  const ExerciseState(this.exerciseList, this.filteredList);

  @override
  List<Object> get props => [exerciseList, filteredList];
}

final class ExerciseInitial extends ExerciseState {
  const ExerciseInitial(super.exerciseList, super.filteredList);
}

final class ExerciseLoaded extends ExerciseState {
  const ExerciseLoaded(super.exerciseList, super.filteredList);
}

final class ExerciseLoading extends ExerciseState {
  const ExerciseLoading(super.exerciseList, super.filteredList);
}

class Failure extends ExerciseState {
  final CustomException error;

  const Failure(super.exerciseList, super.filteredList, {required this.error});

  @override
  List<Object> get props => [error];
}
