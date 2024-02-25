// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class AddCategory extends CategoryEvent {
  final String name;

  const AddCategory(this.name);
}

class RemoveCategory extends CategoryEvent {
  final CategoryModel categoryModel;
  final String exerciseString;
  const RemoveCategory(this.categoryModel, this.exerciseString);
}

class UpdateCategory extends CategoryEvent {
  final CategoryModel categoryModel;
  const UpdateCategory(this.categoryModel);
}

class GetCategories extends CategoryEvent {
  final CategoryModel? categoryModel;
  GetCategories({
    this.categoryModel,
  });
}

class AddExerciseToCategory extends CategoryEvent {
  final ExerciseModel exerciseModel;
  final CategoryModel categoryModel;

  const AddExerciseToCategory(this.exerciseModel, this.categoryModel);
}
