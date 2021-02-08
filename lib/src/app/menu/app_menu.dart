import 'package:lifecycle_example/src/source.dart';

class AppMenu extends AppPopupMenu<String> {
  AppMenu({Key key})
      : _colorPicker = ColorPicker(),
        super(key: key);
  final ColorPicker _colorPicker;

  /// items takes precedence over menuItems
  /// comment this out and see 5 to 8 options.
  @override
  List<String> onItems() {
    //
    final items = <String>[];

    // If the 'countries list' widget is instantiated.
    final widget = context?.findAncestorWidgetOfExactType<CountriesList>();

    if (widget != null) {
      items.addAll(['Color Background']);
    }

    items.addAll(['Option 2', 'Option 3', 'Option 4']);

    return items;
  }

  @override
  ShapeBorder onShape() => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      );

  @override
  void onSelection(String value) {
    switch (value) {
      case 'Color Background':
        {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Select a color'),
                content: SingleChildScrollView(
                  child: _colorPicker.show(),
                ),
              );
            },
          );
        }
        break;

      // case constant_expr2:
      //   {
      //     //statements;
      //   }
      //   break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  @override
  Offset onOffset() => const Offset(0, 45);
}

class ColorPicker {
  //
  static Color _color;
  static Color get color => _color;
  static set color(Color color) {
    if (color != null) {
      _color = color;
    }
  }

  Widget show() => BlockPicker(
        pickerColor: _color ?? Colors.blue,
        onColorChanged: (Color color) {
          _color = color;
          final state = SetState.of<CountriesList>();
          state?.setState(() {});
        },
      );
}
