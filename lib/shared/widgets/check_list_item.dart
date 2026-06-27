import 'package:flutter/material.dart';

class CheckListItem extends StatelessWidget {
  const CheckListItem({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
  });

  final String text;
  final IconData icon;
  final Color iconColor;
  final TextStyle? textStyle;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
