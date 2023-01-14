import 'package:flutter/material.dart';

class NumberInputField extends StatefulWidget {
  final String label;
  final Function(String) onChanged;
  final bool disabled;
  final String initialValue;
  int validatedValue = 0;
  NumberInputField({
    super.key,
    required this.label,
    required this.onChanged,
    this.disabled = false,
    required this.initialValue,
  });

  @override
  // ignore: library_private_types_in_public_api
  _NumberInputFieldState createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  String? error;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: controller,
        onChanged: (val) {
          widget.onChanged(val);
          setState(() {
            error = _validator(val);
          });

          if (error == null) {
            print("Error null, value confirmed!  ");
            widget.validatedValue = int.parse(val);
            print("validatedValue : ${widget.validatedValue}");
          }
        },
        readOnly: widget.disabled,
        keyboardType: TextInputType.number,
        validator: _validator,
        decoration: InputDecoration(
          label: Text(widget.label),
          errorText: error,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'Please enter a number';
    }
    int? number = int.tryParse(value);
    if (number == null || number < 0 || number > 255) {
      return 'Please enter a number between 0 and 255';
    }
    return null;
  }
}
