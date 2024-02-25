// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExerciseModel extends Equatable {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;
  ExerciseModel({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });

  ExerciseModel copyWith({
    String? name,
    String? type,
    String? muscle,
    String? equipment,
    String? difficulty,
    String? instructions,
  }) {
    return ExerciseModel(
      name: name ?? this.name,
      type: type ?? this.type,
      muscle: muscle ?? this.muscle,
      equipment: equipment ?? this.equipment,
      difficulty: difficulty ?? this.difficulty,
      instructions: instructions ?? this.instructions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'muscle': muscle,
      'equipment': equipment,
      'difficulty': difficulty,
      'instructions': instructions,
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map['name'] as String,
      type: map['type'] as String,
      muscle: map['muscle'] as String,
      equipment: map['equipment'] as String,
      difficulty: map['difficulty'] as String,
      instructions: map['instructions'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseModel.fromJson(String source) => ExerciseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Exercise(name: $name, type: $type, muscle: $muscle, equipment: $equipment, difficulty: $difficulty, instructions: $instructions)';
  }

  @override
  List<Object?> get props => [
        name,
        type,
        muscle,
        equipment,
        difficulty,
        instructions,
      ];
}
