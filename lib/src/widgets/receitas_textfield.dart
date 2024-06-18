import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReceitasTextfield extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool autoFocus;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  final double? height;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final dynamic onChanged;
  final bool? validate;
  final Widget? suffixIcon;


  const ReceitasTextfield({
    super.key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
    required this.autoFocus,
    required this.enabled,
    this.inputFormatters,
    this.width,
    this.height,
    this.onSubmitted,
    this.focusNode,
    this.onChanged,
    this.validate,
    this.suffixIcon,
  });

  @override
  State<ReceitasTextfield> createState() => _ReceitasTextfieldState();
}

class _ReceitasTextfieldState extends State<ReceitasTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) => widget.validate == true ? value!.isEmpty ? 'Campo obrigatório' : null : null,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          label: Text(widget.label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onFieldSubmitted: widget.onSubmitted,
        focusNode: widget.focusNode,    
        onChanged: widget.onChanged,
        enabled: widget.enabled,
      ),
      
    );
  }
}