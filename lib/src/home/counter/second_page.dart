import 'package:lifecycle_example/src/source.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title = "You're on the Second Page"}) : super(key: key) {
    // ignore: avoid_print
    print(
        '>>>>>>>>>>>>>>>>>>>>>>>>>   SecondPage StatefulWidget being created. Constructor called.');
  }
  final String title;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends LifecycleState<SecondPage> {
  _SecondPageState() : super() {
    // ignore: avoid_print
    print(
        '>>>>>>>>>>>>>>>>>>>>>>>>>   _SecondPageState being created. Constructor called.');
  }
  // Retain the count with a static field.
  static int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _SecondPageState build() called!');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You're on this second page."),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: avoid_print
          print(
              '>>>>>>>>>>>>>>>>>>>>>>>>>   Second page Button is pressed. setState() called.');
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const CountriesList(),
              ),
            );
          },
          child: const Text('Countries List'),
        ),
        RaisedButton(
          onPressed: () {
            // ignore: avoid_print
            print(">>>>>>>>>>>>>>>>>>>>>>>>>   'First Page' button pressed.");
            Navigator.pop(context);
          },
          child: const Text(
            'First Page',
          ),
        ),
      ],
    );
  }
}
