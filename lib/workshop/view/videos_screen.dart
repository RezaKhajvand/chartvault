import 'package:chartvault/const/borderradius.dart';
import 'package:chartvault/const/borders.dart';
import 'package:chartvault/const/gradient.dart';
import 'package:chartvault/const/texttheme.dart';
import 'package:chartvault/utils/dateformat.dart';
import 'package:chartvault/workshop/bloc/workshop_bloc.dart';
import 'package:chartvault/workshop/models/workshop_model.dart';
import 'package:chartvault/workshop/view/widgets/player_screen.dart';
import 'package:chartvault/widgets/headtitle.dart';
import 'package:chartvault/widgets/imageplaceholder.dart';
import 'package:chartvault/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosScreen extends StatefulWidget {
  final String id;
  const VideosScreen({super.key, required this.id});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WorkshopBloc>().add(FetchWorkshopEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkshopBloc, WorkshopState>(
      builder: (context, state) {
        if (state is WorkshopError) {
          return Center(
              child: OutlinedButton(
                  onPressed: () =>
                      context.read<WorkshopBloc>().add(FetchWorkshopEvent()),
                  child: Text(state.errormsg)));
        } else if (state is WorkshopLoaded) {
          return _buildBody(state.workshop);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildBody(Workshop workshop) {
    return CustomScrollView(
      slivers: [
        const HeadTitle(pageName: 'Video Page'),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.separated(
            itemCount: workshop.data.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) =>
                        PlayerScreen(url: workshop.data[index].videoPath),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  workshop.data[index].title,
                                  style: context.headlineSmall,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  workshop.data[index].descriptions,
                                  style: context.labelSmall,
                                ),
                                const Spacer(),
                                Text(
                                  NewsUtils.formatDateTime(
                                      workshop.data[index].createdAt),
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
                                  child: Image.network(
                                    workshop.data[index].thumbnailPath,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const ImagePlaceHolder(),
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
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 90),
        ),
      ],
    );
  }
}
