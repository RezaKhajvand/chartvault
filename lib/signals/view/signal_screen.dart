import 'package:chartvault/signals/view/widgets/signalcard.dart';
import 'package:chartvault/widgets/headtitle.dart';
import 'package:flutter/material.dart';

class SignalScreen extends StatefulWidget {
  const SignalScreen({super.key});

  @override
  State<SignalScreen> createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen> {
  final List<String> chipList = ['All', 'Active', 'Disable'];
  int chipIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HeadTitle(pageName: 'Signal Page'),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ChoiceChip(
                    onSelected: (value) => setState(() => chipIndex = index),
                    label: Text(chipList[index]),
                    selected: chipIndex == index),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: chipList.length),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 20)),
        SliverList.separated(
          itemCount: 20,
          itemBuilder: (context, index) =>
              SignalCard(id: index.toString(), isDetail: false),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 90))
      ],
    );
  }
}
