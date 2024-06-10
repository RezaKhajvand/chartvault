import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/borders.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/gradbackground.dart';
import 'package:chartvault/const/gradient.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/signals/view/widgets/signalcard.dart';
import 'package:chartvault/signals/view/widgets/updatelist.dart';
import 'package:flutter/material.dart';

class SignalDetailScreen extends StatefulWidget {
  final String id;
  const SignalDetailScreen({super.key, required this.id});

  @override
  State<SignalDetailScreen> createState() => _SignalDetailScreenState();
}

class _SignalDetailScreenState extends State<SignalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: backgroundDecoration,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('GSP / USD'),
            toolbarHeight: 70,
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Follow')),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Hero(
              tag: widget.id,
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: CustomRadius.cardRadius,
                      border: CustomBorders.greyBorder,
                      gradient: CustomGradient.cardGrad),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SignalCardContent(isDetail: true),
                      const Divider(color: CustomColors.borderGrey, height: 0),
                      const SizedBox(height: 16),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child:
                              Text('Updates', style: context.headlineMedium)),
                      const SizedBox(height: 16),
                      const UpdateList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
