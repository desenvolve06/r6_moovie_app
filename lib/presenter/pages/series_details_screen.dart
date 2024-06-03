import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r6_moovie_app/presenter/pages/series/favorites_series_screen.dart';
import 'package:r6_moovie_app/resources/app_colors.dart';
import 'package:r6_moovie_app/utils/utils.dart';
import 'package:r6_moovie_app/presenter/widgets/details/cast.dart';
import 'package:r6_moovie_app/presenter/widgets/details/review.dart';

import '../../domain/entities/series.dart';
import '../../resources/app_strings.dart';
import '../bloc/favorites/favorite_bloc.dart';
import '../bloc/favorites/favorite_state.dart';
import '../widgets/details/info_row.dart';
import '../widgets/details/media_detail_header.dart';
import '../widgets/details/overview.dart';
import '../widgets/home/favorite_toggle_button.dart';

class SeriesDetailsScreen extends StatefulWidget {
  final dynamic item;

  const SeriesDetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  _SeriesDetailsScreenState createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Series series = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.details),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavoritesSeriesScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          // ignore: unused_local_variable
          bool isFavorite = false;
          if (state is FavoritesLoadedState) {
            isFavorite =
                state.favoriteSeries.any((series) => series.id == series.id);
            isFavorite =
                state.favoriteSeries.any((series) => series.id == series.id);
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MediaDetailHeader(
                    media: series,
                    height: 250,
                    action: FavoriteToggleButton(media: series),
                  ),
                ),
                InfoRow(
                  releaseDate: Utils.formatDateToBrazilian(series.firstAirDate),
                  vote: series.voteAverage.toString(),
                  popularity: series.name,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (_selectedIndex == 0) {
                              return AppColors.primaryBackgroundColor;
                            }
                            return AppColors.secondaryBackgroundColor;
                          },
                        ),
                      ),
                      child: const Text(
                        AppStrings.aboutSerie,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 1;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (_selectedIndex == 1) {
                              return AppColors.primaryBackgroundColor;
                            }
                            return AppColors.secondaryBackgroundColor;
                          },
                        ),
                      ),
                      child: const Text(
                        AppStrings.reviews,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (_selectedIndex == 2) {
                              return AppColors.primaryBackgroundColor;
                            }
                            return AppColors.secondaryBackgroundColor;
                          },
                        ),
                      ),
                      child: const Text(
                        AppStrings.cast,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _selectedIndex == 0
                      ? OverView(series.overview.isEmpty
                          ? AppStrings.noLanguageSerie
                          : series.overview)
                      : _selectedIndex == 1
                          ? Review(series.voteAverage.toString())
                          : Cast(series.name),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
