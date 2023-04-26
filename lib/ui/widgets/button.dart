import 'package:flutter/material.dart';
import 'package:notes/ui/theme.dart';

class Button extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Function()? onTap;
  const Button(
      {Key? key, required this.text, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor),
        child: Row(children: [
          icon == null
              ? Container()
              : Icon(
                  icon,
                  color: Theme.of(context).primaryIconTheme.color,
                ),
          const SizedBox(width: 8),
          Text(text, style: buttonStyle)
        ]),
      ),
      onTap: onTap,
    );
  }
}
