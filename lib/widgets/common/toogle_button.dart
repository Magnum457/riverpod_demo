import 'package:flutter/material.dart';

class ToogleButton<T> extends StatelessWidget {
  final ValueNotifier<T> toogle;
  final Widget Function(BuildContext context, T value) builder;

  const ToogleButton({
    super.key,
    required this.toogle,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: toogle,
      builder: (context, T value, _) => builder(context, value),
    );
  }
}
