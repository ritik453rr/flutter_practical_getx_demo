import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Custom Textfield widget
class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final Color? fillColor;
  final bool? filled;
  final IconData? suffixIcon;
  final void Function()? onTapSuffixIcon;
  final TextInputType? keyboardType;
  final String? labelText;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? errorText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  const CustomTextfield({
    super.key,
    this.controller,
    this.keyboardType,
    this.fillColor,
    this.filled,
    this.hintText,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.labelText,
    this.prefixIcon,
    this.obscureText=false,
    this.errorText,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText:obscureText,
      inputFormatters:inputFormatters ,
      onChanged: onChanged,
    
      decoration: InputDecoration(
        fillColor: fillColor,
        labelText: labelText,
        errorText:errorText ,
        hintText:hintText ,
      
        prefixIcon: Icon(prefixIcon),
        filled: filled,
        suffixIcon: IconButton(
          onPressed: onTapSuffixIcon,
          icon: Icon(suffixIcon),
        ),
        enabledBorder: border(),
        focusedBorder: border(color: Colors.blue),
        errorBorder: border(
          color: Colors.red
        ),
        focusedErrorBorder: border(
          color: Colors.red,
        ),
      ),
    );
  }
}

/// Function to create an OutlineInputBorder with a specific color
OutlineInputBorder border({Color color = Colors.grey}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(12),
  );
}
