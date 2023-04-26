import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;
  const CustomAppBar({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: icon, onPressed: () => onPressed),
      actions: [
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            child: const Icon(
              Icons.person_outline_rounded,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
