import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late TextEditingController textEditingController;
  final controller = Get.find<MyProductsController>();
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(_searchChanged);
  }

  _searchChanged() {
    controller.searchProducts(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: const InputDecoration(
          hintText: 'type here..',
          contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search),
          ),
          suffixIconConstraints: BoxConstraints(maxWidth: 70, maxHeight: 20)),
    );
  }
}
