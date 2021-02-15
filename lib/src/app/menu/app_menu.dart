import 'package:lifecycle_example/src/source.dart';

class AppMenu extends AppPopupMenu<String> {
  AppMenu({Key key, this.buttons})
      : _colorPicker = ColorPicker(),
        super(key: key);
  final ColorPicker _colorPicker;

  final List<RaisedButton> buttons;
  final Map<String, RaisedButton> menuButtons = {};

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

    if(buttons != null) {
      for (final RaisedButton button in buttons) {
        final Text text = button.child;
        items.add(text.data);
        menuButtons[text.data] = button;
      }
    }

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
      default:
        {
          /// Possibly a RaisedButton is selected.
          menuButtons[value]?.onPressed();
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
          final state = StateSet.of<CountriesList>();
          // ignore: invalid_use_of_protected_member
          state?.setState(() {});
        },
      );
}
