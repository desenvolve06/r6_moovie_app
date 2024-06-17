import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/widgets/home/banner_item.dart';

import '../stubs/stub.dart';
import '../utils/favorite_bloc_mock.dart';

void main() {
  testWidgets('BannerItem widget test', (WidgetTester tester) async {
    // Arrange
    final banner = seriesMock;
    final mockFavoriteBloc = FavoriteBlocMock();
    final cachedNetworkImageFinder = find.byType(CachedNetworkImage);
    final CachedNetworkImage cachedNetworkImage = tester.widget(cachedNetworkImageFinder);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<FavoriteBloc>(
          create: (_) => mockFavoriteBloc,
          child: BannerItem(banner: banner),
        ),
      ),
    );


    // Assert
    expect(cachedNetworkImageFinder, findsOneWidget);
    expect(
      cachedNetworkImage.imageUrl,
      'https://image.tmdb.org/t/p/w500${banner.backdropPath}',
    );
  });
}
