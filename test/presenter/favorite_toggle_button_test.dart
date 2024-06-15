import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  group('FavoriteToggleButton', () {
    testWidgets('shows favorite icon when isFavorite is true',
            (WidgetTester tester) async {
          await buildApp(tester,anything, true);

          expect(find.byIcon(Icons.favorite), findsOneWidget);
          expect(find.byIcon(Icons.favorite_border), findsNothing);
        });

    testWidgets('shows border icon when isFavorite is false',
            (WidgetTester tester) async {

          await buildApp(tester, anything, false);

          expect(find.byIcon(Icons.favorite_border), findsOneWidget);
          expect(find.byIcon(Icons.favorite), findsNothing);
void testFavoriteIcon(WidgetTester tester, bool isFavorite, IconData expectedIcon, IconData unexpectedIcon) async {
//Implementação dos expects

}
        });

    testWidgets('adds event to favorites on press', (WidgetTester tester) async {
      await buildApp(tester, anything, false);

      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      verify(() => mockFavoriteBloc.add(const AddToFavoritesEvent(anything))).called(1);
    });

    testWidgets('adds event on press when isFavorite is true', (WidgetTester tester) async {
      await buildApp(tester, anything, true);

      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pump();

      verify(() => mockFavoriteBloc.add(const RemoveFromFavoritesEvent(anything))).called(1);
    });
  });
}

void _verifyIcon(WidgetTester tester, IconData expectedIcon, IconData unexpectedIcon) {
  expect(find.byIcon(expectedIcon), findsOneWidget);
  expect(find.byIcon(unexpectedIcon), findsNothing);
}
