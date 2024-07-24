import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/news/bloc/news_bloc.dart';
import 'package:chartvault/news/view/newsdetail_screen.dart';
import 'package:chartvault/utils/dateformat.dart';
import 'package:chartvault/widgets/headtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final double aspectRatio = 5 / 3;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          final bannerRecord = state.news.data.first;
          final newsList = state.news.data.sublist(1);
          return CustomScrollView(
            slivers: [
              const HeadTitle(pageName: 'News Page'),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          NewsDetailScreen(record: bannerRecord),
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
                              tag: bannerRecord.id,
                              child: Image.network(
                                bannerRecord.image,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      const SizedBox(height: 16),
                      Text(
                        bannerRecord.title,
                        maxLines: 1,
                        style: context.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        bannerRecord.content,
                        maxLines: 2,
                        style: context.labelSmall,
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
                            NewsUtils.formatDateTime(bannerRecord.createdAt),
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
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: newsList.length,
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
                                child: Image.network(
                                  newsList[index].image,
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
                                  maxLines: 2,
                                  style: context.headlineSmall,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  newsList[index].content,
                                  maxLines: 2,
                                  style: context.labelSmall,
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
                                      NewsUtils.formatDateTime(
                                          newsList[index].createdAt),
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

        if (state is NewsError) {
          return Center(
            child: OutlinedButton(
                onPressed: () =>
                    BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent()),
                child: const Text('Error')),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
