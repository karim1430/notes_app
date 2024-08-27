import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constant.dart';
import 'package:notes_app/widgets/custom_button.dart';

import 'package:notes_app/widgets/custom_text_field.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hint: 'Tilte',
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hint: "Content",
              maxLine: 5,
            ),
            SizedBox(
              height: 40,
            ),
            CustomBotton(),
          ],
        ),
      ),
    );
  }
}
