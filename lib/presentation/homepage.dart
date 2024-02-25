import 'package:casestudey_assistantapp/presentation/bloc/bloc/category_bloc.dart';
import 'package:casestudey_assistantapp/presentation/dashboard.dart';
import 'package:casestudey_assistantapp/presentation/myprogram.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<Widget> widgets = const [
    DashboardView(),
    MyProgramView(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategoryBloc>().add(GetCategories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "My Program"),
        ],
      ),
      body: widgets[currentIndex],
    );
  }
}
