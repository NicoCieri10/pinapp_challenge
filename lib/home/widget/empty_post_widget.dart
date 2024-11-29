import 'package:flutter/material.dart';

class EmptyPostWidget extends StatelessWidget {
  const EmptyPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No hay posteos'),
    );
  }
}
