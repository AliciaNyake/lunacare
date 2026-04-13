import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lunacare/main.dart';

void main() {
  testWidgets('LunaCare app loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const LunaCareApp());

    expect(find.text('LUNA CARE'), findsOneWidget);
  });
}