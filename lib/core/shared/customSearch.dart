import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch(
      {super.key,
      this.onPressedSearch,

      this.onChanged,
      required this.searchController,
      required this.titlAppbar});
  final String titlAppbar;
  final void Function()? onPressedSearch;

  final void Function(String)? onChanged;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      onChanged: onChanged, //بتعرفك ان في سيرش ولا لا
      controller: searchController,
      decoration: InputDecoration(
        prefixIcon:
            IconButton(onPressed: onPressedSearch, icon:const Icon(Icons.search)),
        hintText: titlAppbar,
        hintStyle:const TextStyle(fontSize: 18 ,height: 1),
        filled: true,
        fillColor: const Color.fromARGB(255, 207, 207, 207),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
