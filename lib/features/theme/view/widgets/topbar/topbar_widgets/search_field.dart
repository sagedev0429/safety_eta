import 'package:animated_sidebar/features/theme/view/widgets/sidebar/sidebar_style.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      height: 40,
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 8,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff4d4d51),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xff4d4d51),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Color(0xff909092),
            fontSize: 16,
          ),
          prefixIcon: Icon(
            PhosphorIcons.magnifyingGlass,
            size: 20,
            color: backgroundColor,
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: Icon(
              PhosphorIcons.fadersHorizontal,
              size: 20,
              color: backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
