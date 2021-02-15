import 'package:lifecycle_example/src/source.dart';

class ThirdBLoC<T extends StatefulWidget> {
  // static saves the count!
  static int _counter = 0;

  int get data => _counter;

  void onPressed() {
    _counter++;

    // Simply seek out the required State object.
    final state = StateSet.of<T>();

    // ignore: invalid_use_of_protected_member
    state?.setState(() {});
  }
}
