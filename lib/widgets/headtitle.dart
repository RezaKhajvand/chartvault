import 'package:chartvault/const/texttheme.dart';
import 'package:flutter/material.dart';

class HeadTitle extends StatelessWidget {
  final String pageName;
  const HeadTitle({
    super.key, required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome", style: context.headlineSmall),
            const SizedBox(height: 4),
            Text(pageName, style: context.headlineLarge),
          ],
        ),
      ),
    );
  }
}
