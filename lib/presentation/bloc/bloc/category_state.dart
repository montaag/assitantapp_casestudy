part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  final List<CategoryModel> categories;
  const CategoryState(this.categories);

  @override
  List<Object> get props => [categories];
}

final class CategoryInitial extends CategoryState {
  const CategoryInitial(super.categories);
}
