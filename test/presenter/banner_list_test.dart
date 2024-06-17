import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r6_moovie_app/presenter/widgets/home/banner_item.dart';
import 'package:r6_moovie_app/presenter/widgets/home/banner_list.dart';

import '../stubs/stub.dart';


void main() {
  testWidgets('BannerList widget test', (WidgetTester tester) async {
    final bannerList = [
      seriesMock
    ];

    // Build the BannerList widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BannerList(
          bannerList: bannerList,
          title: 'Test Banner List',
        ),
      ),
    ));

    // Arrange
    expect(find.text('Test Banner List'), findsOneWidget);

    // Act
    await tester.pump();

    // Assert
    expect(find.byType(BannerItem), findsNWidgets(bannerList.length));
  });
}