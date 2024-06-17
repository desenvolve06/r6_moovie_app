import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_state.dart';
import 'package:r6_moovie_app/presenter/widgets/home/card_image_text.dart';
import 'package:r6_moovie_app/presenter/widgets/home/media_list.dart';
import 'package:r6_moovie_app/resources/app_strings.dart';

import '../stubs/stub.dart';
import 'favorite_bloc_builder_test.dart';

void main() {
  final mockFavoriteBloc = MockFavoriteBloc(); // Replace with your actual mock type

  setUpAll(() async {
    registerFallbackValue(const FavoritesLoadedState([], []));
    await loadAppFonts();
  });

  Future<void> buildApp(WidgetTester tester, {required int index}) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: Scaffold(
          body: BlocProvider<FavoriteBloc>(
            create: (_) => mockFavoriteBloc,
            child: Center(
              child: Container(
                color: Colors.grey[200],
                child: MediaList(
                  mediaList: List.generate(index, (index) => moviesMock),
                  title: AppStrings.recommended,
                  movies: [moviesMock],
                  series: [seriesMock],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }
    // Assert
  testWidgets('MediaList widget test movies three', (WidgetTester tester) async {
    // Arrange
    when(() => mockFavoriteBloc.state).thenReturn(
        const FavoritesLoadedState([], []));
    // Act
    await buildApp(tester, index: 3);

    // Assert
    expect(find.text(AppStrings.recommended), findsOneWidget);
    expect(find.byType(CardImageText), findsWidgets);
    expect(find.byType(MediaList), findsOneWidget);
  });

  testGoldens('MediaList widget golden test movies three', (WidgetTester tester) async {
   // Act
    await buildApp(tester, index: 3);

    // Assert
    await expectLater(
      find.byType(MediaList),
      matchesGoldenFile('golden_image/media_list_three.png'),
    );
  });

  testWidgets('MediaList widget test movies seven', (WidgetTester tester) async {
    // Act
    await buildApp(tester, index: 6);

    // Assert
    expect(find.text(AppStrings.recommended), findsOneWidget);
    expect(find.byType(CardImageText), findsWidgets);
    expect(find.byType(MediaList), findsOneWidget);
  });

  testGoldens('MediaList widget golden test movies seven', (WidgetTester tester) async {
    // Act
    await buildApp(tester, index: 6);

    // Assert
    await expectLater(
        find.byType(MediaList),
      matchesGoldenFile('golden_image/media_list_seven.png'),
    );
  });
}