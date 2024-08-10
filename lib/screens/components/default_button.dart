import 'package:flutter/material.dart';
import 'package:practice_list_view/utils/consts/colors.dart';
import 'package:practice_list_view/utils/theme.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({required this.text, required this.onPressed, super.key});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
        backgroundColor: MaterialStateProperty.all(secondColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )),
      ),
      onPressed: onPressed(),
      child: Text(
        text,
        style: EntryDecoration.titleText
            .copyWith(color: Colors.black, fontSize: 18),
      ),
    );
  }
}
