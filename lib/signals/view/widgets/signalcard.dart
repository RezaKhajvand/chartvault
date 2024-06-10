import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/borders.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/gradient.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/home/view/widgets/RiskRate.dart';
import 'package:chartvault/home/view/widgets/tagcontent.dart';
import 'package:chartvault/signals/view/signaldetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:spoiler_widget/spoiler_text_widget.dart';

class SignalCard extends StatelessWidget {
  final bool isDetail;
  final String id;
  const SignalCard({super.key, required this.id, required this.isDetail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SignalDetailScreen(id: id),
          ));
        },
        child: Hero(
          tag: id,
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: CustomRadius.cardRadius,
                  border: CustomBorders.greyBorder,
                  gradient: CustomGradient.cardGrad),
              child: SignalCardContent(isDetail: isDetail),
            ),
          ),
        ),
      ),
    );
  }
}

class SignalCardContent extends StatelessWidget {
  const SignalCardContent({
    super.key,
    required this.isDetail,
  });

  final bool isDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(gradient: CustomGradient.blueGrad),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Image.asset('images/bitcoin.png', height: 20),
                    const SizedBox(width: 10),
                    Text("GSP/USD", style: context.labelMedium),
                    const Spacer(),
                    Text("Risk : 2/5", style: context.labelMedium),
                    const SizedBox(width: 10),
                    const RiskRate(rateNumber: 3)
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 2,
                  decoration:
                      const BoxDecoration(gradient: CustomGradient.dividerGrad))
            ],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TagContent(
                        color: CustomColors.kellyGreen,
                        text: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style: context.labelSmall, text: "Entry Zone : "),
                          TextSpan(text: "245", style: context.bodySmall)
                        ])),
                      ),
                      const SizedBox(height: 10),
                      TagContent(
                          color: CustomColors.rustyRed,
                          text: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: context.labelSmall,
                                text: "Stop Loss : "),
                            TextSpan(text: "247", style: context.bodySmall)
                          ]))),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(
                color: CustomColors.borderGrey,
                width: 0,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Take Profit 1 : ", style: context.labelSmall),
                        SpoilerTextWidget(
                          text: isDetail ? '245.6' : "222222",
                          style: context.labelSmall,
                          enable: !isDetail,
                          maxParticleSize: 0.5,
                          particleDensity: 6,
                          enableGesture: false,
                          fadeRadius: 5,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text("Take Profit 1 : ", style: context.labelSmall),
                        SpoilerTextWidget(
                          text: isDetail ? '287.8' : "222222",
                          style: context.labelSmall,
                          enable: !isDetail,
                          maxParticleSize: 0.5,
                          particleDensity: 6,
                          enableGesture: false,
                          fadeRadius: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        const Divider(color: CustomColors.borderGrey, height: 0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isDetail
                  ? const SizedBox()
                  : Text(
                      "Tap for Detail",
                      style: context.labelSmall,
                    ),
              isDetail ? const SizedBox() : const Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(style: context.dateSmall, text: "Opened "),
                TextSpan(text: " : 06/04/23 - 12:23", style: context.dateSmall)
              ])),
            ],
          ),
        ),
      ],
    );
  }
}
