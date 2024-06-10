import 'dart:math';
import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/borders.dart';
import 'package:chartvault/const/gradient.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/video/view/widgets/player_screen.dart';
import 'package:chartvault/widgets/headtitle.dart';
import 'package:flutter/material.dart';

class VideosScreen extends StatelessWidget {
  final String id;
  const VideosScreen({super.key, required this.id});


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HeadTitle(pageName: 'Video Page'),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.separated(
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => const PlayerScreen(),
                        ));
                      },
                      child: Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: CustomRadius.cardRadius,
                              border: CustomBorders.greyBorder,
                              gradient: CustomGradient.cardGrad),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'What is cryptocurrency?',
                                        style: context.headlineSmall,
                                      ),
                                      const Spacer(),
                                      Text(
                                        '06/04/23 - 12:23',
                                        style: context.dateSmall,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                AspectRatio(
                                  aspectRatio: 5 / 3,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: CustomRadius.imageRadius,
                                        child: Image.asset(
                                          'images/tumbnail (${Random().nextInt(4) + 1}).webp',
                                          colorBlendMode: BlendMode.multiply,
                                          color: Colors.black45,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.play_circle_fill_rounded,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 10),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 90),
        ),
      ],
    );
  }
}
