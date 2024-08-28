import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';

import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteFromState extends StatefulWidget {
  const AddNoteFromState({super.key});

  @override
  State<AddNoteFromState> createState() => _AddNoteFromStateState();
}

class _AddNoteFromStateState extends State<AddNoteFromState> {
  GlobalKey<FormState> fromKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: 'Tilte',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: "Content",
            maxLine: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          CustomBotton(
            onTap: () {
              if (fromKey.currentState!.validate()) {
                fromKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
        ],
      ),
    );
  }
}
