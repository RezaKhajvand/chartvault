import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/news/utils/news_test.dart';
import 'package:chartvault/news/view/newsdetail_screen.dart';
import 'package:chartvault/widgets/headtitle.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});
  final double aspectRatio = 5 / 3;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HeadTitle(pageName: 'News Page'),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NewsDetailScreen(record: newsList[5]),
              ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                    aspectRatio: aspectRatio,
                    child: ClipRRect(
                      borderRadius: CustomRadius.imageRadius,
                      child: Hero(
                        tag: newsList[5].id,
                        child: Image.asset(
                          newsList[5].imagePath,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                const SizedBox(height: 16),
                Text(
                  newsList[5].title,
                  maxLines: 2,
                  style: context.headlineSmall,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 14,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '06/04/23 - 12:23',
                      style: context.dateSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
        const SliverPadding(padding: EdgeInsets.only(top: 20)),
        SliverList.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: newsList.length - 1,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      NewsDetailScreen(record: newsList[index]),
                ));
              },
              child: SizedBox(
                height: 90,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: aspectRatio,
                      child: Hero(
                        tag: newsList[index].id,
                        child: ClipRRect(
                          borderRadius: CustomRadius.imageRadius,
                          child: Image.asset(
                            newsList[index].imagePath,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsList[index].title,
                            maxLines: 3,
                            style: context.headlineSmall,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 14,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '06/04/23 - 12:23',
                                style: context.dateSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 90))
      ],
    );
  }
}
