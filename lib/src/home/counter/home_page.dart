
import 'package:lifecycle_example/src/source.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends LifecycleState<MyHomePage> {
  _MyHomePageState() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _MyHomePageState constructor called.');
  }

  @override
  void initState() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _MyHomePageState initState() called.');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _MyHomePageState build() called!');
    return FirstPage(
    );
  }
}
