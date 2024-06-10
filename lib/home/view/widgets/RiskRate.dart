import 'package:chartvault/const/borderradius.dart';
import 'package:flutter/material.dart';

class RiskRate extends StatelessWidget {
  final int rateNumber;
  const RiskRate({
    super.key,
    required this.rateNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Container(
            width: 4,
            height: 18,
            margin: EdgeInsets.only(right: index == 4 ? 0 : 2),
            decoration: BoxDecoration(
                borderRadius: CustomRadius.tagRadius,
                color: index <= rateNumber - 1
                    ? const Color(0xff006bff)
                    : const Color(0x33ffffff))),
      ),
    );
  }
}
