import 'package:flutter/material.dart';

class ReceitasButton extends StatefulWidget {
  final String label;
  final double width;
  final VoidCallback onClick;
  final String? variant;
  final double? height;
  final double? fontSize;

  const ReceitasButton({
    super.key,
    required this.label,
    required this.width,
    required this.onClick,
    this.variant = 'primary',
    this.height,
    this.fontSize,
  });

  @override
  State<ReceitasButton> createState() => _ReceitasButtonState();
}

class _ReceitasButtonState extends State<ReceitasButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onClick,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all( widget.variant == 'primary' ? Colors.red : Colors.white),
        maximumSize: WidgetStateProperty.all(Size(widget.width, widget.height ?? 45)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.red),
          ),
        ),
      ),
      child: Center(
        child: Text(
          widget.label,
          style: TextStyle(fontSize: widget.fontSize ?? 14, color: widget.variant == 'primary' ? Colors.white : Colors.red),
        ),
      ),
    );
  }
}