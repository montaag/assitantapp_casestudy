import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void showCustomDialog(BuildContext context, CustomAlert customEventDialog) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return customEventDialog;
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}

class CustomAlert extends StatefulWidget {
  final String title;
  final String description;

  const CustomAlert({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  CustomAlertState createState() => CustomAlertState();
}

class CustomAlertState extends State<CustomAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 1000.w,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: Colors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 20,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        widget.title,
                        style: TextStyle(fontSize: 26),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.description,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
