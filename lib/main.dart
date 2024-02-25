import 'package:casestudey_assistantapp/data/repositories/category_repo.dart';
import 'package:casestudey_assistantapp/data/repositories/exercise_repo.dart';
import 'package:casestudey_assistantapp/presentation/bloc/bloc/category_bloc.dart';
import 'package:casestudey_assistantapp/presentation/bloc/exercisebloc/exercise_bloc.dart';
import 'package:casestudey_assistantapp/presentation/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final CategoryRepo data = await CategoryRepo.create();

  runApp(MyApp(repo: data));
}

class MyApp extends StatelessWidget {
  final CategoryRepo repo;

  const MyApp({
    super.key,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ExerciseBloc(ExerciseRepo()),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(repo),
        ),
      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation, DeviceType deviceType) => MaterialApp(
          title: 'Case Study',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.grey.shade100,
              appBarTheme: AppBarTheme(color: Colors.grey.shade100)),
          home: const HomePage(),
        ),
      ),
    );
  }
}
