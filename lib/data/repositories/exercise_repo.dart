import 'package:casestudey_assistantapp/data/services/exercise_service.dart';
import 'package:casestudey_assistantapp/domain/models/errors.dart';
import 'package:casestudey_assistantapp/domain/models/exercise.dart';
import 'package:either_dart/either.dart';

class ExerciseRepo {
  final ExerciseService service = ExerciseService();

  Future<Either<CustomError, List<ExerciseModel>>> getExerciseList() async {
    return await service.getAllExercise();
  }
}
