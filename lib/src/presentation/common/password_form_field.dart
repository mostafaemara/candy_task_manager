import 'package:flutter/material.dart';

class PassowrdFormField extends StatelessWidget {
  const PassowrdFormField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: TextFormField(
        controller: controller,
      ),
    );
  }
}
