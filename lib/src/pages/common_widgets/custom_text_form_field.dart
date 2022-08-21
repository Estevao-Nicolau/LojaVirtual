import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormTextField extends StatefulWidget {
  const CustomFormTextField({
    Key? key,
    required this.icon,
    required this.label,
    required this.keyType,
    this.inputFormatters,
    // required this.controller,

    this.isDense,
    this.isSecret = false,
    this.initialValue,
    this.readOnly = false,
    // required this.validator,
  }) : super(key: key);

  final IconData icon;
  final String label;
  // final String? Function(String?) validator;
  final bool isSecret;
  final TextInputType? keyType;
  final bool? isDense;
  final List<TextInputFormatter>? inputFormatters;
  // final TextEditingController? controller;
  final String? initialValue;
  final bool readOnly;

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        // controller: widget.controller,
        obscureText: isObscure,
        // validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          prefixIcon: Icon(widget.icon),
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        keyboardType: widget.keyType,
        autocorrect: false,
      ),
    );
  }
}
