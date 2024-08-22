import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_ai/config/theme/brut_colors.dart';
import 'package:meal_ai/core/provider/search_provider.dart';
import 'package:meal_ai/core/styles/sizes.dart';

class SearchBarWidget extends ConsumerWidget {
  final bool showFilter;
  final FocusNode focusNode = FocusNode();

  SearchBarWidget({Key? key, this.showFilter = false}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSizes.xs),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                ref.read(searchRecipeProvider.notifier).updateSearch(value);
              },
              focusNode: focusNode,
              cursorColor: black1,
              decoration: InputDecoration(
                focusColor: Colors.white,
                filled: true,
                fillColor: focusNode.hasFocus ? Colors.white : cream3,
                hintText: 'Search any recipes',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: PaddingSizes.sm, horizontal: PaddingSizes.sm),
                prefixIconConstraints:
                    const BoxConstraints(minHeight: 10, minWidth: 10),
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: PaddingSizes.xs),
                  child: Icon(
                    size: 30,
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
