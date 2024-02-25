// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryModel extends Equatable {
  @Id()
  int id;

  final String name;
  final List<String> exerciseID;
  CategoryModel({
    this.id = 0,
    required this.name,
    required this.exerciseID,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, exerciseID];
}
