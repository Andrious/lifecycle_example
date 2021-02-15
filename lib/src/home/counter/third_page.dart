import 'package:lifecycle_example/src/source.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key, this.title = "You're on the Third Page"})
      : super(key: key) {
    // ignore: avoid_print
    print(
        '>>>>>>>>>>>>>>>>>>>>>>>>>   ThirdPage StatefulWidget being created. Constructor called.');
  }
  final String title;

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends LifecycleState<ThirdPage> {
  _ThirdPageState() : super() {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _ThirdPageState constructor called.');
  }

  @override
  void initState() {
    super.initState();
    bloc = ThirdBLoC<ThirdPage>();
  }

  ThirdBLoC bloc;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('>>>>>>>>>>>>>>>>>>>>>>>>>   _ThirdPageState build() called!');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          AppMenu(
            buttons: [
              countriesList,
              secondPage,
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You're on this third page."),
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
              '>>>>>>>>>>>>>>>>>>>>>>>>>   Third page Button is pressed. setState() called.');
          bloc.onPressed();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      persistentFooterButtons: <Widget>[
        countriesList,
        secondPage,
      ],
    );
  }

  RaisedButton get countriesList =>
      nextButton(context, CountriesList(), label: 'Countries List');

  RaisedButton get secondPage => backButton(context, label: 'Second Page');
}
