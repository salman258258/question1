// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:question1/app/controllers/shared_controller.dart';
import 'package:question1/main.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Get.put(SharedController());
  });

  tearDown(Get.reset);

  testWidgets('first screen shows the supplied background and profile assets',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Palindrome Checker'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Palindrome'), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                'assets/images/profile.png',
      ),
      findsOneWidget,
    );
  });
}
