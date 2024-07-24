import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/signals/models/signal_model.dart';
import 'package:chartvault/utils/dateformat.dart';
import 'package:flutter/material.dart';

class UpdateList extends StatefulWidget {
  final List<Update> updateList;
  const UpdateList({super.key, required this.updateList});

  @override
  State<UpdateList> createState() => _UpdateListState();
}

class _UpdateListState extends State<UpdateList> {
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
    return Builder(builder: (context) {
      if (widget.updateList.isEmpty) {
        return Expanded(
          child: Center(
            child: Text(
              'Updates is empty',
              style: context.labelSmall,
            ),
          ),
        );
      }

      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Updates', style: context.headlineMedium)),
            const SizedBox(height: 16),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.separated(
                    itemCount: widget.updateList.length,
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
                              NewsUtils.formatDateTime(
                                  widget.updateList[index].createdAt),
                              style: context.labelSmall,
                            ),
                            Text(widget.updateList[index].text,
                                style: context.labelMedium),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 14),
                  ),
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
                                    colors: [
                                      Colors.transparent,
                                      Colors.black87
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            height: 150,
                            width: double.infinity),
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
