// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CustomException extends Equatable implements Exception {
  final String message;
  final DateTime date;
  const CustomException({required this.date, required this.message});

  CustomException.now({
    required this.message,
  }) : date = DateTime.now();

  @override
  List<Object?> get props => [message, date];
}

class CustomError {
  String error;
  int code;
  CustomError({
    required this.error,
    required this.code,
  });
}
