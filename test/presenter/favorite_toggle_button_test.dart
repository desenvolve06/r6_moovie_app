import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_event.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_state.dart';
import 'package:r6_moovie_app/presenter/widgets/home/favorite_toggle_button.dart';

class MockFavoriteEvent extends Fake implements FavoriteEvent {}

class MockFavoriteBloc extends MockBloc<FavoriteEvent, FavoriteState>
    implements FavoriteBloc {}

void main() {
  late FavoriteBloc mockFavoriteBloc;

  setUp(() {
    mockFavoriteBloc = MockFavoriteBloc();
    when(() => mockFavoriteBloc.state).thenReturn(FavoritesInitialState());
  });

  Future<void> buildApp(
    WidgetTester tester,
    dynamic media,
    bool isFavorite,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<FavoriteBloc>.value(
          value: mockFavoriteBloc,
          child: FavoriteToggleButton(
            media: media,
            isFavorite: isFavorite,
          ),
        ),
      ),
    );
  }

  setUpAll(() async {
    await loadAppFonts();
  });

  group('FavoriteToggleButton', () {
    testWidgets('shows favorite icon when isFavorite is true',
        (WidgetTester tester) async {
      // Act
      await buildApp(tester, anything, true);

      // Assert
      _verifyIcon(tester, Icons.favorite, Icons.favorite_border);
    });

    testWidgets('shows border icon when isFavorite is false',
        (WidgetTester tester) async {
      // Act
      await buildApp(tester, anything, false);

      // Assert
      _verifyIcon(tester, Icons.favorite_border, Icons.favorite);
    });

    testWidgets('adds event to favorites on press',
        (WidgetTester tester) async {
      // Act
      await buildApp(tester, anything, false);
      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      // Assert
      verify(() => mockFavoriteBloc.add(const AddToFavoritesEvent(anything)))
          .called(1);
    });

    testWidgets('adds event on press when isFavorite is true',
        (WidgetTester tester) async {
      // Act
      await buildApp(tester, anything, true);
      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pump();

      // Assert
      verify(() =>
              mockFavoriteBloc.add(const RemoveFromFavoritesEvent(anything)))
          .called(1);
    });
  });
}

void _verifyIcon(
    WidgetTester tester, IconData expectedIcon, IconData unexpectedIcon) {
  expect(find.byIcon(expectedIcon), findsOneWidget);
  expect(find.byIcon(unexpectedIcon), findsNothing);
}
