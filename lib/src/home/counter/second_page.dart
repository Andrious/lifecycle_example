import 'package:lifecycle_example/src/source.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title = "You're on the Second Page"})
      : super(key: key) {
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
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _SecondPageState constructor called.');
  }

  CounterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CounterBloc<_SecondPageState>();
  }

  @override
  // ignore: file_names
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _SecondPageState build() called!');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          AppMenu(
            buttons: [
              firstPage,
              thirdPage,
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You're on this second page."),
            const Text('You have pushed the button this many times:'),
            Text(
              '${bloc.data}',
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
          bloc.onPressed();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: <Widget>[
        firstPage,
        thirdPage,
      ],
    );
  }

  // RaisedButton get countriesList => RaisedButton(
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute<void>(
  //             builder: (BuildContext context) => CountriesList(),
  //           ),
  //         );
  //       },
  //       child: const Text('Countries List'),
  //     );

  RaisedButton get firstPage => backButton(context, label: 'First Page');

  RaisedButton get thirdPage => nextButton(context, ThirdPage(), label: 'Third Page');

      // RaisedButton get thirdPage => RaisedButton(
      //   onPressed: () {
      //     // ignore: avoid_print
      //     print(">>>>>>>>>>>>>>>>>>>>>>>>>   'Third Page' button pressed.");
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute<void>(
      //         builder: (BuildContext context) => ThirdPage(),
      //       ),
      //     );
      //   },
      //   child: const Text(
      //     'Third Page',
      //   ),
      // );
}
