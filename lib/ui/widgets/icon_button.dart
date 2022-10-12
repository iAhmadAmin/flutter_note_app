import 'package:flutter/material.dart';
import 'package:note_app/ui/styles/text_styles.dart';

class MyIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onTap;
  final String txt;

  const MyIconButton({Key? key, this.icon, required this.onTap, this.txt = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 44,
          width: icon != null ? 44 : 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF3B3B3B),
          ),
          child: Center(
              child: icon != null
                  ? Icon(icon, color: Colors.white)
                  : Text(
                      txt,
                      style: titleTextStyle.copyWith(fontSize: 18),
                    )),
        ));
  }
}
