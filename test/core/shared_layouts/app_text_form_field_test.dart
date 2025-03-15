import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_haven/core/shared_layouts/read_more_text.dart';

void main() {
  const textStyle = TextStyle(fontSize: 16);
  const textButtonStyle = TextStyle(fontSize: 14, color: Colors.blue);
  const maxWidth = 200.0;

  testWidgets('ReadMoreText should render text correctly', (
    WidgetTester tester,
  ) async {
    const text =
        'This is a long text that should be truncated after a few lines.';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReadMoreText(
            text,
            textStyle: textStyle,
            textButtonStyle: textButtonStyle,
            maxWidth: maxWidth,
          ),
        ),
      ),
    );

    // Verify the text is rendered
    expect(find.text(text), findsOneWidget);

    expect(find.text('Read More'), findsOneWidget);
  });

  testWidgets(
    'ReadMoreText should toggle between "Read More" and "Show Less"',
    (WidgetTester tester) async {
      const text =
          'This is a long text that should be truncated after a few lines.';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReadMoreText(
              text,
              textStyle: textStyle,
              textButtonStyle: textButtonStyle,
              maxWidth: maxWidth,
            ),
          ),
        ),
      );

      expect(find.text('Read More'), findsOneWidget);

      // Tap the "Read More" button
      await tester.tap(find.text('Read More'));
      await tester.pump(); // Trigger a frame update

      // Verify the "Show Less" button is visible
      expect(find.text('Show Less'), findsOneWidget);

      // Tap the "Show Less" button
      await tester.tap(find.text('Show Less'));
      await tester.pump(); // Trigger a frame update

      // Verify the "Read More" button is visible again
      expect(find.text('Read More'), findsOneWidget);
    },
  );

  testWidgets(
    'ReadMoreText should not show button if text does not exceed maxLines',
    (WidgetTester tester) async {
      const shortText = 'Short text';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ReadMoreText(
              shortText,
              textStyle: textStyle,
              textButtonStyle: textButtonStyle,
              maxWidth: maxWidth,
            ),
          ),
        ),
      );

      // Verify the text is rendered
      expect(find.text(shortText), findsOneWidget);

      // Verify the button is not visible
      expect(find.text('Read More'), findsNothing);
      expect(find.text('Show Less'), findsNothing);
    },
  );

  testWidgets('ReadMoreText should respect maxLines when not expanded', (
    WidgetTester tester,
  ) async {
    const text =
        'This is a long text that should be truncated after a few lines.';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReadMoreText(
            text,
            textStyle: textStyle,
            textButtonStyle: textButtonStyle,
            maxWidth: maxWidth,
          ),
        ),
      ),
    );

    // Verify the text is truncated
    final textWidget = tester.widget<Text>(find.byType(Text).first);
    expect(textWidget.maxLines, 3);
    expect(textWidget.overflow, TextOverflow.ellipsis);
  });

  testWidgets('ReadMoreText should show full text when expanded', (
    WidgetTester tester,
  ) async {
    const text =
        'This is a long text that should be truncated after a few lines.';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReadMoreText(
            text,
            textStyle: textStyle,
            textButtonStyle: textButtonStyle,
            maxWidth: maxWidth,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Read More'));
    await tester.pump(); // Trigger a frame update

    // Verify the text is fully visible
    final textWidget = tester.widget<Text>(find.byType(Text).first);
    expect(textWidget.maxLines, isNull);
    expect(textWidget.overflow, TextOverflow.visible);
  });
}
