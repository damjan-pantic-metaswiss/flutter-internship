import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color enabledColor = Color(0xFFC9D2DE);
const Color errorColor = Color(0xFFFF4242);
const Color focusedColor = Color(0xFF7E44F8);
const Color disabledColor = Color(0xFFC9D2DE);

class TextInputField extends StatefulWidget {
  final String label;
  final Widget? suffixIcon;
  final String? suffixText;
  final bool enabled;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;

  const TextInputField({
    super.key,
    required this.label,
    this.suffixIcon,
    this.suffixText,
    this.enabled = true,
    this.initialValue,
    this.validator,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      controller: widget.controller,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      style: const TextStyle(
        color: Color(0xFF181E25),
        fontFamily: 'Inter',
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        labelText: widget.label,
        labelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            Color color = const Color(0xFF181E25);
            if (states.contains(MaterialState.error)) {
              color = errorColor;
            } else if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              color = focusedColor;
            } else if (states.contains(MaterialState.disabled)) {
              color = const Color(0xFF7B828A);
            }
            return TextStyle(
              color: color,
              fontFamily: 'Inter',
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            );
          },
        ),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            Color color = const Color(0xFF181E25);
            if (states.contains(MaterialState.error)) {
              color = errorColor;
            } else if (states.contains(MaterialState.focused)) {
              color = focusedColor;
            }
            return TextStyle(
              color: color,
              fontFamily: 'Inter',
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            );
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.enabled ? enabledColor : disabledColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: enabledColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: focusedColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: disabledColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorColor),
        ),
        filled: true,
        fillColor:
            widget.enabled ? const Color(0xFFFFFFFF) : const Color(0xFFF3F4F8),
        suffixIcon: widget.suffixIcon,
        suffixIconColor: const Color(0xFF34A4E3),
        suffixText: widget.suffixText,
        suffixStyle: const TextStyle(
          color: Color(0xFF949494),
          fontFamily: 'Inter',
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: const TextStyle(
          color: errorColor,
          fontFamily: 'Inter',
          fontSize: 12,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
