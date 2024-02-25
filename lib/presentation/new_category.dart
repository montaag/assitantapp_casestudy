import 'package:casestudey_assistantapp/presentation/bloc/bloc/category_bloc.dart';
import 'package:casestudey_assistantapp/presentation/widgets/cusotm_alert_dialog.dart';
import 'package:casestudey_assistantapp/presentation/widgets/custom_button.dart';
import 'package:casestudey_assistantapp/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCategoryView extends StatefulWidget {
  const NewCategoryView({super.key});

  @override
  State<NewCategoryView> createState() => _NewCategoryViewState();
}

class _NewCategoryViewState extends State<NewCategoryView> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormFiled(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  hintText: "Category Name",
                ),
                CustomButton(
                  title: "Add New Category",
                  buttonType: CustomButtonType.primary,
                  onPressed: () {
                    if (name != null && name != "") {
                      context.read<CategoryBloc>().add(AddCategory(name!));
                      Navigator.pop(context);
                    } else {
                      showCustomDialog(context, const CustomAlert(title: "HATA", description: "İsim boş bırakılamaz"));
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
