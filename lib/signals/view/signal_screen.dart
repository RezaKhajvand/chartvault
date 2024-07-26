import 'package:chartvault/signals/bloc/signals_bloc.dart';
import 'package:chartvault/signals/view/widgets/signalcard.dart';
import 'package:chartvault/widgets/headtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagChip {
  final String name;
  final int? statusCode;

  TagChip({required this.name, this.statusCode});
}

class SignalScreen extends StatefulWidget {
  const SignalScreen({super.key});

  @override
  State<SignalScreen> createState() => _SignalScreenState();
}

class _SignalScreenState extends State<SignalScreen>with AutomaticKeepAliveClientMixin {
    @override
  bool get wantKeepAlive => true;
  final List<TagChip> chipList = [
    TagChip(name: 'All'),
    TagChip(name: 'Open', statusCode: 1),
    TagChip(name: 'Close', statusCode: 2)
  ];
  int chipIndex = 0;

  @override
  void initState() {
    super.initState();
    getSignals();
  }

  getSignals({int? statusCode}) {
    context.read<SignalsBloc>().add(SignalsFetchEvent(statusCode: statusCode));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                    onSelected: (value) {
                      getSignals(statusCode: chipList[index].statusCode);
                      setState(() => chipIndex = index);
                    },
                    label: Text(chipList[index].name),
                    selected: chipIndex == index),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: chipList.length),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 20)),
        BlocBuilder<SignalsBloc, SignalsState>(
          builder: (context, state) {
            if (state is SignalsLoaded) {
              var signals = state.signals.data;
              return SliverList.separated(
                itemCount: signals.length,
                itemBuilder: (context, index) =>
                    SignalCard(record: signals[index], isDetail: false),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
              );
            }

            if (state is SignalsError) {
              return SliverToBoxAdapter(
                child: Center(
                  child: OutlinedButton(
                      onPressed: () =>
                          context.read<SignalsBloc>().add(SignalsFetchEvent()),
                      child: const Text('Retry')),
                ),
              );
            }

            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 90))
      ],
    );
  }
}
