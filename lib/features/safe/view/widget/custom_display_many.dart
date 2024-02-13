import 'package:flutter/material.dart';

class CustomDisplyMany extends StatelessWidget {
  const CustomDisplyMany(
      {super.key,
      required this.textColor,
      required this.many,
      required this.text,
      this.flexOfLabel = 1,
      this.flexOfMany = 1});
  final Color textColor;
  final String? many;
  final String text;
  final int flexOfLabel;
  final int flexOfMany;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: flexOfMany,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 170, 170, 170)),
                ),
                child: Text(
                  "$many",
                  textAlign: TextAlign.center,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: flexOfLabel,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 170, 170, 170))),
              child: Text(
                text,
                style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
