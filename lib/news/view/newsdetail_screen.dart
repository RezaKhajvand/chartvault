import 'package:chartvault/const/colors.dart';
import 'package:chartvault/const/gradbackground.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/news/utils/news_test.dart';
import 'package:flutter/material.dart';

class NewsDetailScreen extends StatefulWidget {
  final NewsTest record;
  const NewsDetailScreen({super.key, required this.record});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundDecoration,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 5,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Stack(
                  children: [
                    Hero(
                      tag: widget.record.id,
                      child: Image.asset(
                        widget.record.imagePath,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black87, Colors.transparent],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        height: 120,
                        width: double.infinity),
                  ],
                ),
              ),
              backgroundColor: CustomColors.appbarColor,
              expandedHeight: 210,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              sliver: SliverToBoxAdapter(
                child: Text(
                  widget.record.title,
                  style: context.headlineLarge,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 14,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '06/04/23 - 12:23',
                      style: context.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              sliver: SliverToBoxAdapter(
                child: Text(
                  widget.record.desc,
                  style: context.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
