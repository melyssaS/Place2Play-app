import 'package:flutter/material.dart';
import 'package:place_2_play/constans.dart';

typedef SearchBarTextChangeCallback = void Function(String s);

class SearchBar extends StatelessWidget {
  final SearchBarTextChangeCallback? onTextChangeCallback;
  final VoidCallback? onSearchPressed;
  final String placeholder;
  final TextEditingController _controller = TextEditingController();
  

  SearchBar(
      {super.key,
      this.onTextChangeCallback,
      required this.placeholder,
      this.onSearchPressed,
      String initialSearch = ""}) {
    _controller.text = initialSearch;
    if (initialSearch.isNotEmpty) {
      onSearchPressed?.call();
    }
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: TextField(
          style: const TextStyle(fontSize: 18),
          onChanged: (value) => {onTextChangeCallback?.call(value)},
          autofocus: false,
          controller: _controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(18),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: kPrimaryColor)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
              filled: true,
              fillColor: Colors.red.withOpacity(0.1),
              hintText: placeholder)),
    );
  }
}
