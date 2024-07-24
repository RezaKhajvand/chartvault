import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/borders.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/gradient.dart';
import 'package:chartvault/const/router.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/home/view/widgets/RiskRate.dart';
import 'package:chartvault/home/view/widgets/tagcontent.dart';
import 'package:chartvault/signals/models/signal_model.dart';
import 'package:chartvault/utils/dateformat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoiler_widget/spoiler_text_widget.dart';

class SignalCard extends StatelessWidget {
  final bool isDetail;
  final SignalRecord record;
  const SignalCard({super.key, required this.record, required this.isDetail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () => context.push(signalDetailPage, extra: record),
        child: Hero(
          tag: record.id.toString(),
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: CustomRadius.cardRadius,
                  border: CustomBorders.greyBorder,
                  gradient: CustomGradient.cardGrad),
              child: SignalCardContent(record: record, isDetail: isDetail),
            ),
          ),
        ),
      ),
    );
  }
}

class SignalCardContent extends StatelessWidget {
  final SignalRecord record;
  const SignalCardContent({
    super.key,
    required this.isDetail,
    required this.record,
  });

  final bool isDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient:
                  record.statusCode == 1 ? CustomGradient.blueGrad : null),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Image.network(record.stock.logoPath, height: 20),
                    const SizedBox(width: 10),
                    Text(record.stock.abbreviation, style: context.labelMedium),
                    const SizedBox(width: 8),
                    const CircleAvatar(
                        backgroundColor: Colors.white, radius: 4),
                    const SizedBox(width: 8),
                    Text(record.status,
                        style: context.labelSmall.copyWith(color: Colors.grey)),
                    const Spacer(),
                    Text("Risk : ${record.risk}/5", style: context.labelMedium),
                    const SizedBox(width: 10),
                    RiskRate(rateNumber: int.parse(record.risk))
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 2,
                  decoration: BoxDecoration(
                      color: record.statusCode != 1
                          ? CustomColors.borderGrey
                          : null,
                      gradient: record.statusCode == 1
                          ? CustomGradient.dividerGrad
                          : null))
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
                          TextSpan(
                              text: record.entryZone, style: context.bodySmall)
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
                            TextSpan(
                                text: record.stopLoss, style: context.bodySmall)
                          ]))),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(color: CustomColors.borderGrey, width: 0),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: List.generate(
                        record.takeProfits.length,
                        (index) => Row(
                          children: [
                            Text("Take Profit ${index + 1} : ",
                                style: context.labelSmall),
                            SpoilerTextWidget(
                              text: isDetail
                                  ? record.takeProfits[index].takeProfit
                                  : "222222",
                              style: context.labelSmall,
                              enable: !isDetail,
                              maxParticleSize: 0.5,
                              particleDensity: 6,
                              enableGesture: false,
                              fadeRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    )),
              )
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
                TextSpan(
                    text: " : ${NewsUtils.formatDateTime(record.createdAt)}",
                    style: context.dateSmall)
              ])),
            ],
          ),
        ),
      ],
    );
  }
}
