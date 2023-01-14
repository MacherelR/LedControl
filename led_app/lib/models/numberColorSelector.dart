import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:led_app/models/settings.dart';

import 'numberInput.dart';

// ignore: must_be_immutable
class ColorSelector extends StatelessWidget {
  ColorSelector(
      {Key? key,
      required int rValue,
      required int gValue,
      required int bValue,
      required this.onChanged})
      : super(key: key);
  int rValue = 0;
  int gValue = 0;
  int bValue = 0;
  late final NumberInputField rInputField;
  late final NumberInputField gInputField;
  late final NumberInputField bInputField;

  final Function() onChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: rInputField = NumberInputField(
                label: "R",
                initialValue: rValue.toString(),
                onChanged: (value) {
                  rValue = rInputField.validatedValue;
                  onChanged();
                },
              ),
            ),
            SizedBox(
              width: 100,
              child: gInputField = NumberInputField(
                label: "G",
                initialValue: gValue.toString(),
                onChanged: (value) {
                  gValue = gInputField.validatedValue;
                  print("gValue : ${gValue}");
                  onChanged();
                },
              ),
            ),
            SizedBox(
              width: 100,
              child: bInputField = NumberInputField(
                label: "B",
                initialValue: bValue.toString(),
                onChanged: (value) {
                  bValue = bInputField.validatedValue;
                  onChanged();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
