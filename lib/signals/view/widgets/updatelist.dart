import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:flutter/material.dart';

class UpdateList extends StatefulWidget {
  const UpdateList({super.key});

  @override
  State<UpdateList> createState() => _UpdateListState();
}

class _UpdateListState extends State<UpdateList> {
  final List<String> updatesText = [
    'Update on GSP for next 1 hour',
    'Update on GSP for next 1 hour , Update on GSP',
    'Update on gsp',
    'Update on gsp Update on gsp Update',
    'Update on GSP for next 1 hour',
    'Update on GSP for next 1 hour , Update on GSP',
    'Update on gsp',
    'Update on gsp Update on gsp Update',
    'Update on GSP for next 1 hour',
    'Update on GSP for next 1 hour , Update on GSP',
    'Update on gsp',
    'Update on gsp Update on gsp Update',
  ];
  final ScrollController _controller = ScrollController();
  bool isMaxScroll = false;
  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.offset == _controller.position.maxScrollExtent) {
          setState(() {
            isMaxScroll = true;
          });
        } else {
          setState(() {
            isMaxScroll = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.separated(
              controller: _controller,
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 16),
              itemBuilder: (context, index) => UnconstrainedBox(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 1.5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: CustomRadius.cardRadius,
                          color: index == 0
                              ? CustomColors.brightBlue
                              : CustomColors.brightBlue.withOpacity(0.2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '06/04/23 - 12:23',
                            style: context.labelSmall,
                          ),
                          Text(updatesText[index], style: context.labelMedium),
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemCount: updatesText.length),
          StatefulBuilder(builder: (context, setState) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
              opacity: isMaxScroll ? 0 : 1,
              child: IgnorePointer(
                child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: CustomRadius.cardRadius,
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black87],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    height: 150,
                    width: double.infinity),
              ),
            );
          })
        ],
      ),
    );
  }
}
