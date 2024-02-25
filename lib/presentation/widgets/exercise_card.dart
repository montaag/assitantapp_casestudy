import 'package:casestudey_assistantapp/domain/models/categories.dart';
import 'package:casestudey_assistantapp/domain/models/exercise.dart';
import 'package:casestudey_assistantapp/presentation/bloc/bloc/category_bloc.dart';
import 'package:casestudey_assistantapp/presentation/widgets/custom_chip.dart';
import 'package:casestudey_assistantapp/presentation/widgets/select_Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slideable/slideable.dart';

class ExerciseCard extends StatefulWidget {
  final ExerciseModel exerciseModel;
  final bool isSlideable;
  final void Function()? onPress;
  const ExerciseCard({
    super.key,
    required this.exerciseModel,
    this.isSlideable = false,
    this.onPress,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20, bottom: 12),
      child: Slideable(
        items: widget.isSlideable
            ? <ActionItems>[
                ActionItems(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPress: widget.onPress ?? () {},
                  backgroudColor: Colors.transparent,
                )
              ]
            : [],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.exerciseModel.name),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              builder: (context) => SelectCategory(
                                    exerciseModel: widget.exerciseModel,
                                  ));
                        },
                        icon: Icon(Icons.add_circle))
                  ],
                ),
                Row(
                  children: [
                    CustomChip(text: widget.exerciseModel.type),
                  ],
                ),
                const SizedBox(height: 12),
                Text(widget.exerciseModel.muscle),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
