import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  const CustomFormTextField({
    Key? key,
    required this.icon,
    required this.label,
    required this.keyType,
    required this.controller,
    this.enabled,
    this.isDense,
    this.isSecret = false,
    required this.validator,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final String? Function(String?) validator;
  final bool isSecret;
  final TextInputType keyType;
  final bool? isDense;
  final TextEditingController? controller;
  final bool? enabled;

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
        enabled: widget.enabled,
        controller: widget.controller,
        obscureText: isObscure,
        validator: widget.validator,
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
