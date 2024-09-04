import 'package:flutter/material.dart';
import 'package:prodigy_ad_02/utils/app_strings.dart';

class RepTextField extends StatelessWidget {
  const RepTextField({
    super.key,
    required this.controller,
    this.isForDescription = false,
  });

  final TextEditingController controller;
  final bool isForDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDescription ? 6 : null,
          cursorHeight: !isForDescription ? 30 : null,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
              border: isForDescription ? InputBorder.none : null,
              counter: Container(),
              hintText: isForDescription ? AppStrings.addNote : null,
              prefixIcon: isForDescription
                  ? const Icon(
                      Icons.bookmark_border,
                      color: Colors.grey,
                    )
                  : null,
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black,
              ))),
          onFieldSubmitted: (value) {
            // Later
          },
          onChanged: (value) {
            // Later
          },
        ),
      ),
    );
  }
}
