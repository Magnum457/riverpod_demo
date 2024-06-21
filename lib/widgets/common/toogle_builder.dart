import 'package:flutter/material.dart';

class ToogleBuilder<T> extends StatelessWidget {
  final ValueNotifier<T> toogle;
  final Widget Function(BuildContext context, T value) builder;

  const ToogleBuilder({
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
