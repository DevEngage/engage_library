import 'package:flutter/material.dart';

class EngageCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final bool isLoading;

  const EngageCard({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.only(top: 2, bottom: 2, left: 16, right: 16),
    this.padding = const EdgeInsets.only(top: 16, bottom: 13),
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Card(
        elevation: 0,
        child: Container(
          padding: padding,
          child: isLoading
              ? Container(
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
