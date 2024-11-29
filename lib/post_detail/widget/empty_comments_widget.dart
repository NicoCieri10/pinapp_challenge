import 'package:flutter/material.dart';

class EmptyCommentsWidget extends StatelessWidget {
  const EmptyCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sin comentarios'),
    );
  }
}
