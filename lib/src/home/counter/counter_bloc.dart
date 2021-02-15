
import 'package:lifecycle_example/src/source.dart';

class CounterBloc<T extends State> extends StateBLoC<T> {
  //
  static int _counter = 0;

  int get data => _counter;

  void onPressed() {
    _counter++;
    // ignore: invalid_use_of_protected_member
    state?.setState(() {});
  }
}
