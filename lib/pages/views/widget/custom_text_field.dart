import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color,
        width: 1.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      cursorColor: const Color(0xFF04332D),

      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Please enter ${widget.hint}";
            }
            return null;
          },

      decoration: InputDecoration(
        hintText: widget.hint,

        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),

        filled: true,
        fillColor: const Color(0xffF7F7F7),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),

        prefixIcon:
            widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: Colors.grey)
                : null,

        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: Colors.grey,
                  ),
                )
                : null,

        enabledBorder: _border(Colors.grey.shade300),

        focusedBorder: _border(const Color(0xFF04332D)),

        errorBorder: _border(Colors.red),

        focusedErrorBorder: _border(Colors.red),
      ),
    );
  }
}