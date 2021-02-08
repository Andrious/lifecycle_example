
import 'package:lifecycle_example/src/source.dart';

mixin LifeCycleObserver implements WidgetsBindingObserver {
  //
  String classType = '';

  /// Called when the system tells the app to pop the current route.
  /// For example, on Android, this is called when the user presses
  /// the back button.
  ///
  @override
  Future<bool> didPopRoute() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didPopRoute');
    return Future<bool>.value(false);
  }

  /// Called when the host tells the application to push a new route onto the
  /// navigator.
  ///
  @override
  Future<bool> didPushRoute(String route) {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didPushRoute');
    return Future<bool>.value(false);
  }

  /// Called when the host tells the application to push a new
  /// [RouteInformation] and a restoration state onto the router.
  ///
  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didPushRouteInformation');
    return didPushRoute(routeInformation.location);
  }

  /// Called when the application's dimensions change. For example,
  /// when a phone is rotated.
  @override
  void didChangeMetrics() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didChangeMetrics');
  }

  /// Called when the platform's text scale factor changes.
  @override
  void didChangeTextScaleFactor() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didChangeTextScaleFactor');
  }

  /// Brightness changed.
  @override
  void didChangePlatformBrightness() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didChangePlatformBrightness');
  }

  /// Called when the system tells the app that the user's locale has
  /// changed. For example, if the user changes the system language
  /// settings.
  ///
  @override
  void didChangeLocales(List<Locale> locale) {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didChangeLocales');
  }

  /// Called when the system puts the app in the background or returns the app to the foreground.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// Passing these possible values:
    /// AppLifecycleState.paused (may enter the suspending state at any time)
    /// AppLifecycleState.resumed
    /// AppLifecycleState.inactive (may be paused at any time)
    /// AppLifecycleState.suspending (Android only)
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): $state');
  }

  /// Called when the system is running low on memory.
  @override
  void didHaveMemoryPressure() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didHaveMemoryPressure');
  }

  /// Called when the system changes the set of active accessibility features.
  @override
  void didChangeAccessibilityFeatures() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didChangeAccessibilityFeatures');
  }
}