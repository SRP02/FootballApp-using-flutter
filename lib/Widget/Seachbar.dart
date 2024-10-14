import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search Teams',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: onChanged, // Memanggil callback ketika teks berubah
      ),
    );
  }
}
