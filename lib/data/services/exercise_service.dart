import 'dart:convert';

import 'package:casestudey_assistantapp/domain/models/errors.dart';
import 'package:casestudey_assistantapp/domain/models/exercise.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

class ExerciseService {
  var headers = {'X-RapidAPI-Key': '1f2881497amsh71002369c920fbdp1ce98cjsnf501488e0593'};
  Future<Either<CustomError, List<ExerciseModel>>> getAllExercise() async {
    try {
      final response = await http.get(
        Uri.parse('https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        List<ExerciseModel> exerciseList = List<ExerciseModel>.from((json.decode(response.body)).map((e) => ExerciseModel.fromMap(e)));

        return Right(exerciseList);
      } else {
        return Left(CustomError(error: json.decode(response.body)["message"], code: response.statusCode));
      }
    } catch (e) {
      return Left(CustomError(error: e.toString(), code: 0));
    }
  }
}
