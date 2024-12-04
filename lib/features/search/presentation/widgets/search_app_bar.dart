import 'dart:async';
import 'package:flutter/material.dart';
import 'package:waie/core/theming/colors.dart';

class SearchAppBar extends StatefulWidget {
  final Function(String) onSearchChanged;
  final VoidCallback onFilterPressed;

  const SearchAppBar({
    Key? key,
    required this.onSearchChanged,
    required this.onFilterPressed,
  }) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearchChanged(value);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              controller: _searchController,
              onChanged: _onSearchChanged,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 0.5,
                wordSpacing: 1,
              ),
              cursorColor: ColorsManager.mainGreen,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black12.withOpacity(0.05),
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: ColorsManager.mainGreen,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            color: ColorsManager.mainGreen,
            onPressed: widget.onFilterPressed,
          ),
        ],
      ),
    );
  }
}
