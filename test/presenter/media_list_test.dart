import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_state.dart';
import 'package:r6_moovie_app/presenter/widgets/home/card_image_text.dart';
import 'package:r6_moovie_app/presenter/widgets/home/media_list.dart';

import '../stubs/stub.dart';
import '../utils/favorite_bloc_mock.dart';

void main() {
  final mockFavoriteBloc = FavoriteBlocMock();
  final List<dynamic> mediaList = [moviesMock];

  setUpAll(() {
    registerFallbackValue(const FavoritesLoadedState(
       [],
      [],
    ));
  });

  testWidgets('MediaList widget test', (WidgetTester tester) async {
    when(() => mockFavoriteBloc.state).thenReturn(const FavoritesLoadedState(
      [],
       [],
    ));
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<FavoriteBloc>.value(
            value: mockFavoriteBloc,
            child: Center(
              child: Container(
                color: Colors.grey[200],
                child: MediaList(
                  mediaList: mediaList,
                  title: 'Recomendados',
                  movies: [],
                  series: [],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Recomendados'), findsOneWidget);
    expect(find.byType(CardImageText), findsNWidgets(mediaList.length));
    expect(find.byType(MediaList), findsOneWidget);

  });
}
