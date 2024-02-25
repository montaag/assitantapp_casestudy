import 'package:bloc/bloc.dart';
import 'package:casestudey_assistantapp/data/repositories/category_repo.dart';
import 'package:casestudey_assistantapp/domain/models/categories.dart';
import 'package:casestudey_assistantapp/domain/models/exercise.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo repo;
  CategoryBloc(this.repo) : super(CategoryInitial([])) {
    on<AddCategory>((event, emit) {
      repo.createCategory(event.name);
      List<CategoryModel> categories = repo.getCategories();
      emit(CategoryInitial(categories));
    });
    on<RemoveCategory>((event, emit) {
      repo.deleteExerciseFromCategory(event.categoryModel, event.exerciseString);
      List<CategoryModel> categories = repo.getCategories();
      emit(CategoryInitial(List.from(categories)));
    });
    on<UpdateCategory>((event, emit) {
      repo.updateCategory(event.categoryModel);
      List<CategoryModel> categories = repo.getCategories();
      emit(CategoryInitial(categories));
    });
    on<GetCategories>((event, emit) {
      List<CategoryModel> categories = repo.getCategories();
      emit(CategoryInitial(categories));
    });
    on<AddExerciseToCategory>((event, emit) {
      CategoryModel categoryModel = event.categoryModel;
      categoryModel.exerciseID.add(event.exerciseModel.name);
      repo.updateCategory(categoryModel);
      List<CategoryModel> categories = repo.getCategories();
      emit(CategoryInitial(categories));
    });
  }
}
