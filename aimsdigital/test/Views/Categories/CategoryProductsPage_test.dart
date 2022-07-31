import 'package:aimsdigital/Views/Categories/CategoryCoursesPage.dart';
import 'package:aimsdigital/Widgets/StaggeredDualView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CategoryCoursesPage ...', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CategoryCoursesPage(category: "Test", uidCategory: ""),
    ));

    final title = find.text('Test');
    expect(title, findsOneWidget);

    final staggeredDualView = find.byType(StaggeredDualView);
    expect(staggeredDualView, findsOneWidget);
  });
  testWidgets('Testing if Staggered Dual View Shows items ...', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CategoryCoursesPage(category: "Test", uidCategory: ""),
    ));

    final staggeredDualView = find.byType(StaggeredDualView);
    expect(staggeredDualView, findsOneWidget);

    final card = find.byType(Card);
    expect(card, findsNothing);
  });
}
