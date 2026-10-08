import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:concepts_demo_app/main.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('App renders HomeScreen with all 3 concepts and nav cards',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ConceptsDemoApp());
    await tester.pumpAndSettle();

    // Verify AppBar Title
    expect(find.text('Concepts Studio'), findsOneWidget);

    // Verify 3 Concept Cards are present
    expect(find.text('User Input & Forms'), findsOneWidget);
    expect(find.text('Images, Assets & Fonts'), findsOneWidget);
    expect(find.text('Interactive Animations'), findsOneWidget);
  });

  testWidgets('Navigation to FormScreen and Form validation flow',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ConceptsDemoApp());
    await tester.pumpAndSettle();

    // Tap Card 1 to navigate to /form
    await tester.tap(find.text('User Input & Forms'));
    await tester.pumpAndSettle();

    // Verify FormScreen AppBar
    expect(find.text('User Input & Forms'), findsOneWidget);

    // Try submitting empty form to trigger validators
    await tester.tap(find.text('Submit Form'));
    await tester.pumpAndSettle();

    // Verify validation errors appear
    expect(find.text('Please enter your full name'), findsOneWidget);
    expect(find.text('Please enter your email address'), findsOneWidget);
    expect(find.text('Please enter your contact number'), findsOneWidget);
    expect(find.text('Please enter a message or feedback'), findsOneWidget);

    // Fill valid data
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Full Name'), 'Alex Morgan');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Email Address'), 'alex@example.com');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Phone Number'), '9876543210');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Feedback / Message'),
        'Flutter concepts demo is working properly.');

    // Submit valid form
    await tester.tap(find.text('Submit Form'));
    await tester.pumpAndSettle();

    // Verify SnackBar appears
    expect(find.byType(SnackBar), findsOneWidget);
    expect(
        find.text('Form submitted successfully for Alex Morgan!'),
        findsOneWidget);

    // Verify validated submission data card
    expect(find.text('Validated Submission Data'), findsOneWidget);
  });

  testWidgets('Navigation to GalleryScreen displays GridView and Poppins info',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ConceptsDemoApp());
    await tester.pumpAndSettle();

    // Tap Card 2 to navigate to /gallery
    await tester.tap(find.text('Images, Assets & Fonts'));
    await tester.pumpAndSettle();

    // Verify GalleryScreen AppBar
    expect(find.text('Images, Assets & Fonts'), findsOneWidget);
    expect(find.text('Custom Font: Poppins'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('Navigation to AnimationScreen toggles AnimatedContainer state',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ConceptsDemoApp());
    await tester.pumpAndSettle();

    // Tap Card 3 to navigate to /animation
    await tester.tap(find.text('Interactive Animations'));
    await tester.pumpAndSettle();

    // Verify AnimationScreen AppBar
    expect(find.text('Interactive Animations'), findsOneWidget);
    expect(find.byType(AnimatedContainer), findsOneWidget);

    // Initial state: 150 × 150
    expect(find.text('150 × 150'), findsOneWidget);

    // Tap Toggle State button
    await tester.tap(find.text('Toggle State'));
    await tester.pump(); // Start animation
    await tester.pump(const Duration(milliseconds: 650)); // Finish animation

    // Transformed state: 250 × 160
    expect(find.text('250 × 160'), findsOneWidget);
    expect(find.text('Revert State'), findsOneWidget);
  });
}
