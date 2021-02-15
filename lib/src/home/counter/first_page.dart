import 'package:lifecycle_example/src/source.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key key, this.title = 'First Page'}) : super(key: key);
  final String title;

  @override
  State createState() => _FirstPageState();
}

class _FirstPageState extends LifecycleState<FirstPage> {
  _FirstPageState() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _FirstPageState. Constructor called.');
  }
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _FirstPageState build() called!');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          AppMenu(
            buttons: [secondPage],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: avoid_print
          print(
              '>>>>>>>>>>>>>>>>>>>>>>>>>   First page Button is pressed. setState() called.');
          setState(() {
            counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: <Widget>[
        secondPage,
      ],
    );
  }

  RaisedButton get secondPage => RaisedButton(
        onPressed: () {
          // ignore: avoid_print
          print(">>>>>>>>>>>>>>>>>>>>>>>>>   'Second Page' button pressed.");
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => SecondPage(),
            ),
          );
        },
        child: const Text(
          'Second Page',
        ),
      );

  @override
  void deactivate() {
    super.deactivate();
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _FirstPageState deactivated.');
  }

  @override
  void dispose() {
    super.dispose();
    // ignore: avoid_print
    print(
        '>>>>>>>>>>>>>>>>>>>>>>>>>   _FirstPageState disposed. Counter was $counter');
  }
}
