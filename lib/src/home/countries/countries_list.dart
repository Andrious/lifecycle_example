import 'package:intl/intl.dart';

import 'package:lifecycle_example/src/source.dart' hide ColorPicker;

import 'package:lifecycle_example/src/app/menu/app_menu.dart' show ColorPicker;

import 'package:flutter_svg/flutter_svg.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key key}) : super(key: key);
  @override
  State createState() => _CountriesList();
}

class _CountriesList extends LifecycleState<CountriesList> {
  //
  final bool _error = false;
  bool _loading = true;
  final List<dynamic> _countries = [];
  final NumberFormat num = NumberFormat('###,###,###,##0');
  @override
  void initState() {
    super.initState();
    ColorPicker.color = const Color(0xffff9800);
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<List<dynamic>>(
        future: getCountries(),
        initialData: const [],
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ));
          } else if (snapshot.hasError) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Error while loading countries!'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  AppMenu(),
                ],
              ),
              body: countries(),
            );
          } else {
            return Container();
          }
        },
      );

  Future<List<dynamic>> getCountries() async {
    if (_countries.isEmpty) {
      final List<dynamic> list = await Countries.get();
      _countries.addAll(list);
    }
    return _countries;
  }

  Widget countries() => ListView.builder(
      itemCount: _countries.length,
      itemBuilder: (context, index) {
        final Countries country = _countries[index];
        return Theme(
          data: ThemeData(
            textTheme: const TextTheme(
              bodyText2: TextStyle(fontSize: 20),
            ),
          ),
          child: LifeCycleWidget(
            child: Card(
              color: ColorPicker.color,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country.name,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      country.nativeName,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Capital: ${country.capital}',
                            ),
                            Text(
                              'Pop.: ${num.format(country.population)}',
                            ),
                            Text(
                              'Location: ${country.region}',
                            ),
                            Text(
                              'Inhabitants: ${country.demonym}',
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 100,
                                maxWidth: 100,
                                minHeight: 100,
                                maxHeight: 100,
                              ),
                              child: SvgPicture.network(
                                country.flag,
                                placeholderBuilder: (context) =>
                                    const CircularProgressIndicator(),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                country.subregion,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
