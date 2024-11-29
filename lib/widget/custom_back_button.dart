import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.pop,
      padding: const EdgeInsets.only(left: 10),
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
}
