import 'package:flutter/services.dart';

import '../../../_imports.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {super.key,
      this.title,
      required this.hint,
      this.controller,
      this.maxLines = 1, this.borderRadius, this.contentPadding, this.formatter, this.width});
  final String? title;
  final String hint;
  final int maxLines;
  final double? borderRadius;
  final double? width;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? formatter;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title!=null)Text(title!),
          TextField(
            maxLines: maxLines,
            controller: controller,
            inputFormatters: formatter,
            decoration: InputDecoration(
                hintText: hint,
                contentPadding:
                    contentPadding??const EdgeInsets.symmetric(vertical: 0, horizontal: 18.0),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(borderRadius??30),
                )),
          ),
        ],
      ),
    );
  }
}
