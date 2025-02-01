import 'package:flutter/material.dart';

class MoviesSearchBar extends StatelessWidget {
  final void Function(String) onSearch;
  MoviesSearchBar({super.key, required this.onSearch});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(
          Icons.search,
        ),
        hintText: "Search movies...",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      onSubmitted: onSearch,
      onTapOutside: (_) {
        _controller.clear();
      },
      onChanged: (query) {
        if (query.isNotEmpty) {
          onSearch(query);
        }
      },
    );
  }
}
