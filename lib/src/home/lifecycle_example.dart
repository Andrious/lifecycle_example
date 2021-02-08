
import 'package:lifecycle_example/src/source.dart';

class LifeCycleExample extends StatefulWidget {
  const LifeCycleExample({Key key}) : super(key: key);
  @override
  LifeCycleExampleState createState() => LifeCycleExampleState();
}

class LifeCycleExampleState extends LifecycleState<LifeCycleExample> {
  InfiniteListState list;

  @override
  void initState() {
    super.initState();
    list = InfiniteListState(this);
    list.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatefulWidget Lifecycle')),
      body: list.body(),
    );
  }
}
