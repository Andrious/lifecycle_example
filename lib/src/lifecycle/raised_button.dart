import 'package:flutter/rendering.dart';

import 'package:lifecycle_example/src/source.dart';

RaisedButton backButton(BuildContext context,
    {String label, AppRaisedButton button}) {
  final _text = label == null ? '' : label.trim();
  return _raisedButton(
    context,
    label: label,
    onPressed: () {
      // ignore: avoid_print
      print(">>>>>>>>>>>>>>>>>>>>>>>>>   '$_text' button pressed.");
      Navigator.pop(context);
    },
  );
}

RaisedButton nextButton(
  BuildContext context,
  Widget child, {
  String label,
  AppRaisedButton button,
}) {
  assert(child != null, 'nextButton(): child required!');
  final _text = label == null ? '' : label.trim();
  return _raisedButton(
    context,
    label: label,
    onPressed: () {
      // ignore: avoid_print
      print(">>>>>>>>>>>>>>>>>>>>>>>>>   '$_text' button pressed.");
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => child,
        ),
      );
    },
  );
}

RaisedButton _raisedButton(
  BuildContext context, {
  String label,
  @required VoidCallback onPressed,
  AppRaisedButton button,
}) {
  assert(context != null, '_raisedButton(): BuildContext required!');
  assert(onPressed != null, '_raisedButton(): VoidCallback required!');
  final _text = label == null ? '' : label.trim();
  final _button = button ?? AppRaisedButton();
  return _button._raisedButton(
    onPressed: onPressed,
    child: Text(_text),
  );
}

class AppRaisedButton {
  //
  factory AppRaisedButton() => _this ??= AppRaisedButton._();

  AppRaisedButton._();

  static AppRaisedButton _this;

  VoidCallback onPressed;
  VoidCallback onLongPress;
  ValueChanged<bool> onHighlightChanged;
  MouseCursor mouseCursor;
  ButtonTextTheme textTheme;
  Color textColor;
  Color disabledTextColor;
  Color color;
  Color disabledColor;
  Color focusColor;
  Color hoverColor;
  Color highlightColor;
  Color splashColor;
  Brightness colorBrightness;
  double elevation;
  double focusElevation;
  double hoverElevation;
  double highlightElevation;
  double disabledElevation;
  EdgeInsetsGeometry padding;
  VisualDensity visualDensity;
  ShapeBorder shape;
  Clip clipBehavior = Clip.none;
  FocusNode focusNode;
  bool autofocus = false;
  MaterialTapTargetSize materialTapTargetSize;
  Duration animationDuration;
  Widget child;

  RaisedButton _raisedButton({
    Key key,
    @required VoidCallback onPressed,
    VoidCallback onLongPress,
    ValueChanged<bool> onHighlightChanged,
    MouseCursor mouseCursor,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    double elevation,
    double focusElevation,
    double hoverElevation,
    double highlightElevation,
    double disabledElevation,
    EdgeInsetsGeometry padding,
    VisualDensity visualDensity,
    ShapeBorder shape,
    Clip clipBehavior = Clip.none,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    Duration animationDuration,
    Widget child,
  }) =>
      RaisedButton(
        key: key,
        onPressed: onPressed ?? this.onPressed,
        onLongPress: onLongPress ?? this.onLongPress,
        onHighlightChanged: onHighlightChanged ?? this.onHighlightChanged,
        mouseCursor: mouseCursor ?? this.mouseCursor,
        textTheme: textTheme ?? this.textTheme,
        textColor: textColor ?? this.textColor,
        disabledTextColor: disabledTextColor ?? this.disabledTextColor,
        color: color ?? this.color,
        disabledColor: disabledColor ?? this.disabledColor,
        focusColor: focusColor ?? this.focusColor,
        hoverColor: hoverColor ?? this.hoverColor,
        highlightColor: highlightColor ?? this.highlightColor,
        splashColor: splashColor ?? this.splashColor,
        colorBrightness: colorBrightness ?? this.colorBrightness,
        elevation: elevation ?? this.elevation,
        focusElevation: focusElevation ?? this.focusElevation,
        hoverElevation: hoverElevation ?? this.hoverElevation,
        highlightElevation: highlightElevation ?? this.highlightElevation,
        disabledElevation: disabledElevation ?? this.disabledElevation,
        padding: padding ?? this.padding,
        visualDensity: visualDensity ?? this.visualDensity,
        shape: shape ?? this.shape,
        clipBehavior: clipBehavior ?? this.clipBehavior,
        focusNode: focusNode ?? this.focusNode,
        autofocus: autofocus ?? this.autofocus,
        materialTapTargetSize:
            materialTapTargetSize ?? this.materialTapTargetSize,
        animationDuration: animationDuration ?? this.animationDuration,
        child: child ?? this.child,
      );
}
