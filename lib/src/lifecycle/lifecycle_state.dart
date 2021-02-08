
import 'package:lifecycle_example/src/source.dart';

class LifeCycleWidget extends StatefulWidget {
  const LifeCycleWidget({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  State<StatefulWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends LifecycleState<LifeCycleWidget> {
  /// No declared constructor, and so a default constructor is called.
  /// It has no arguments and invokes the superclass's no-argument constructor.

  @override
  void initState() {
    super.initState();
    classType = widget?.child?.runtimeType?.toString();
    // ignore: avoid_print
    print('$classType(): initState');
  }

  @override
  Widget build(BuildContext context) => widget.child;
}


class LifecycleState<T extends StatefulWidget> extends SetState<StatefulWidget>
    with LifeCycleObserver {

  /// Return the specific Widget of type T
  @override
  T get widget => super.widget;

  //
  @override
  void initState() {
    super.initState();
    // ignore: no_runtimetype_tostring
    classType = runtimeType?.toString();
    WidgetsBinding.instance.addObserver(this);
  }

  /// The framework calls this method when this State object will never
  /// build again.
  /// Note: THERE IS NO GUARANTEE THIS METHOD WILL RUN in the Framework.
  @override
  void dispose() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): dispose');
    // Unregisters the given observer.
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// The framework calls this method whenever it removes this State object
  /// from the tree.
  @override
  void deactivate() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): deactivated');
    super.deactivate();
  }

  /// Override this method to respond when the [widget] changes (e.g., to start
  /// implicit animations).
  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  /// Called when a dependency of this State object changes.
  @override
  void didChangeDependencies() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): didChangeDependencies');
    super.didChangeDependencies();
  }

  /// Called whenever the application is reassembled during debugging, for
  /// example during hot reload.
  @override
  void reassemble() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   $classType(): reassemble');
    super.reassemble();
  }
  @override
  Widget build(BuildContext context) => Container();

  @override
  void setState(VoidCallback fn) => super.setState(fn);
}