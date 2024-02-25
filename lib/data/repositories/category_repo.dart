import 'package:casestudey_assistantapp/domain/models/categories.dart';
import 'package:casestudey_assistantapp/domain/models/exercise.dart';
import 'package:casestudey_assistantapp/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class CategoryRepo {
  late List<CategoryModel> programList;
  late final Store store;

  CategoryRepo._create(this.store) {
    programList = List.from(store.box<CategoryModel>().getAll());
  }

  static Future<CategoryRepo> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "database"));
    return CategoryRepo._create(store);
  }

  void createCategory(String name) {
    CategoryModel category = CategoryModel(name: name, exerciseID: []);
    store.box<CategoryModel>().put(category);
  }

  void deleteExerciseFromCategory(CategoryModel category, String name) {
    category.exerciseID.remove(name);
    store.box<CategoryModel>().put(category);
  }

  void updateCategory(CategoryModel category) {
    store.box<CategoryModel>().put(category);
  }

  List<CategoryModel> getCategories() {
    return store.box<CategoryModel>().getAll();
  }

  List<ExerciseModel> getExercises(CategoryModel categoryModel) {
    List<ExerciseModel> allData = store.box<ExerciseModel>().getAll();
    List<ExerciseModel> filtered = [];

    for (var element in allData) {
      if (categoryModel.exerciseID.contains(element.name)) {
        filtered.add(element);
      }
    }
    return filtered;
  }
}
