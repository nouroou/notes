import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:notes/ui/theme.dart';

class InputField extends StatelessWidget {
  final String inputTitle;
  final String inputHint;
  final Widget? inputIcon;
  final TextEditingController? controller;
  const InputField(
      {Key? key,
      required this.inputTitle,
      required this.inputHint,
      this.inputIcon,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputTitle,
            style: titleStyle,
          ),
          Container(
            padding: const EdgeInsets.only(top: 12),
            child: TextFormField(
              autofocus: false,
              readOnly: inputIcon == null ? false : true,
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: inputIcon,
                hintText: inputHint,
                hintStyle: unselectedStyle,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color:
                            Get.isDarkMode ? Colors.black12 : Colors.white12)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
