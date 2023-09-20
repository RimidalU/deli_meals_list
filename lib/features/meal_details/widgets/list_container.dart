import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({
    super.key,
    required this.child,
    required this.bodyHeight,
    required this.mediaQuery,
  });

  final Widget child;
  final double bodyHeight;
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bodyHeight * 0.27,
      width: mediaQuery.size.width * 0.9,
      decoration: BoxDecoration(
          // color: Colors.amber,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}
