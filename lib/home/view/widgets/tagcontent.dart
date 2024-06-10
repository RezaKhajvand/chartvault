import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/padding.dart';
import 'package:flutter/material.dart';

class TagContent extends StatelessWidget {
  final Widget text;
  final Color color;
  const TagContent({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CustomPadding.tagPadding,
      decoration: BoxDecoration(
          borderRadius: CustomRadius.cardRadius,
          border: Border.all(width: 0.80, color: color),
          color: color.withOpacity(0.2)),
      child: text,
    );
  }
}
