import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../models/hsv_picker.dart';

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  bool lightTheme = true;
  Color currentColor = Colors.amber;
  List<Color> currentColors = [Colors.yellow, Colors.green];
  List<Color> colorHistory = [];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        useWhiteForeground(currentColor) ? Colors.white : Colors.black;

    return AnimatedTheme(
      data: lightTheme ? ThemeData.light() : ThemeData.dark(),
      child: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => setState(() => lightTheme = !lightTheme),
            icon: Icon(lightTheme
                ? Icons.dark_mode_rounded
                : Icons.light_mode_rounded),
            label: Text(lightTheme ? 'Night' : '  Day '),
            backgroundColor: currentColor,
            foregroundColor: foregroundColor,
            elevation: 15,
          ),
          body: HSVColorPickerExample(
            pickerColor: currentColor,
            onColorChanged: changeColor,
            colorHistory: colorHistory,
            onHistoryChanged: (List<Color> colors) => colorHistory = colors,
          ),
        );
      }),
    );
  }
}
