import 'package:active_system/core/constant/styles.dart';
import 'package:active_system/core/shared/customSearch.dart';
import 'package:flutter/material.dart';

class CustomTableHeader extends StatelessWidget {
  const CustomTableHeader(
      {super.key, required this.searchController, required this.header});
  final TextEditingController searchController;
  final String header;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.only(bottom: 10, left: 20, right: 15),
            child: CustomSearch(
              searchController: searchController,
              titlAppbar: "بحث",
              onChanged: (val) {},
              onPressedSearch: () {},
            ),
          ),
        ),
        SizedBox(
          child: Text(
            header,
            style: Styles.style23,
          ),
        ),
      ],
    );
  }
}
