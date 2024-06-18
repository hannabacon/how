import 'package:flutter/material.dart';

class ReceitasWhiteButton extends StatefulWidget {
  final String label;
  final double width;
  final VoidCallback onClick;
  final String? variant;
  final double? height;
  final double? fontSize;

  const ReceitasWhiteButton({
    super.key,
    required this.label,
    required this.width,
    required this.onClick,
    this.variant = 'primary',
    this.height,
    this.fontSize,
  });

  @override
  State<ReceitasWhiteButton> createState() => _ReceitasWhiteButtonState();
}

class _ReceitasWhiteButtonState extends State<ReceitasWhiteButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onClick();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (_isSelected) {
              return widget.variant == 'primary' ? Colors.red : Colors.green;
            }
            return widget.variant == 'primary' ? Colors.white : Colors.red;
          },
        ),
        maximumSize: WidgetStateProperty.all(Size(widget.width, widget.height ?? 45)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Colors.white),
          ),
        ),
      ),
      child: Center(
        child: Text(
          widget.label,
          style: TextStyle(fontSize: widget.fontSize ?? 14, color: _isSelected ? Colors.white : (widget.variant == 'primary' ? Colors.red : Colors.white)),
        ),
      ),
    );
  }
}