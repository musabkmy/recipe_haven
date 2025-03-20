import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:recipe_haven/config/dependency_injection/dependency_injection.dart';
import 'package:recipe_haven/core/utils/app_bloc_observer.dart';
import 'package:recipe_haven/features/view_recipe/presentation/layouts/layouts.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      debugPrint(
        '${record.level.name}:\n ${record.loggerName}: ${record.message}\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\',
      );
    });
    await ScreenUtil.ensureScreenSize();
    configurationDependency(Env.dev);
    Bloc.observer = AppBlocObserver();
  });
  testWidgets('view a Recipe', (WidgetTester tester) async {
    // await tester.pumpWidget(const MyApp());
    await tester.pump();
    // await tester.pumpWidget(App());

    final gestureFinder = find.byKey(const Key('GestureDetector get recipe'));
    expect(gestureFinder, findsOneWidget);

    await tester.tap(gestureFinder);
    for (int i = 0; i < 5; i++) {
      // because pumpAndSettle doesn't work with riverpod
      await tester.pump(Duration(seconds: 1));
    }

    // final listFinder = find.byType(BuildCookingStep);
    // final itemFinder = find.byKey(const ValueKey('5'));
    // // debugDumpApp();

    // await tester.scrollUntilVisible(itemFinder, 5, scrollable: listFinder);

    // expect(listFinder, findsNWidgets(5));
  });
}
