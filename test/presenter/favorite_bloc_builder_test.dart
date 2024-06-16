import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_bloc.dart';
import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_event.dart';

import 'package:r6_moovie_app/presenter/bloc/favorites/favorite_state.dart';
import 'package:r6_moovie_app/presenter/widgets/home/favorite_bloc_builder.dart';
import 'package:r6_moovie_app/presenter/widgets/home/favorite_toggle_button.dart';

import '../stubs/stub.dart';

class MockFavoriteBloc extends MockBloc<FavoriteEvent, FavoriteState> implements FavoriteBloc {}

class FakeFavoriteState extends Fake implements FavoriteState {}

class FakeFavoriteEvent extends Fake implements FavoriteEvent {}

void main() {
  late MockFavoriteBloc mockFavoriteBloc;

  setUpAll(() {
    registerFallbackValue(FakeFavoriteState());
    registerFallbackValue(FakeFavoriteEvent());
  });

  setUp(() {
    mockFavoriteBloc = MockFavoriteBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MaterialApp(
      home: BlocProvider<FavoriteBloc>.value(
        value: mockFavoriteBloc,
        child: widget,
      ),
    );
  }

  testWidgets('FavoriteBlocBuilder shows FavoriteToggleButton with isFavorite true when media is in favorites', (WidgetTester tester) async {
    when(() => mockFavoriteBloc.state).thenReturn( FavoritesLoadedState([moviesMock], []));

    await tester.pumpWidget(buildTestableWidget(FavoriteBlocBuilder(media: moviesMock)));

    final toggleButtonFinder = find.byType(FavoriteToggleButton);
    expect(toggleButtonFinder, findsOneWidget);

    final favoriteToggleButton = tester.widget<FavoriteToggleButton>(toggleButtonFinder);
    expect(favoriteToggleButton.isFavorite, true);
  });

  testWidgets('FavoriteBlocBuilder shows FavoriteToggleButton with isFavorite false when media is not in favorites', (WidgetTester tester) async {
    when(() => mockFavoriteBloc.state).thenReturn(const FavoritesLoadedState([], []));

    await tester.pumpWidget(buildTestableWidget(FavoriteBlocBuilder(media: moviesMock)));

    final toggleButtonFinder = find.byType(FavoriteToggleButton);
    expect(toggleButtonFinder, findsOneWidget);

    final favoriteToggleButton = tester.widget<FavoriteToggleButton>(toggleButtonFinder);
    expect(favoriteToggleButton.isFavorite, false);
  });
}
