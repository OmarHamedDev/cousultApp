import 'package:consult_app/core/extension/extension.dart';
import 'package:flutter/material.dart';

class CustomAuthFieldLabelWidget extends StatelessWidget {
  final String text;
  const CustomAuthFieldLabelWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: context.textTheme.labelMedium,
      ),
    );
  }
}
