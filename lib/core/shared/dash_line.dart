import 'package:flutter/material.dart';

class DashLisne extends StatelessWidget {
  const DashLisne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(25, (index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 8,
        height: 2,color: Color(0xFFB7B7B7),
      ),
    )),
    );
  }
}

