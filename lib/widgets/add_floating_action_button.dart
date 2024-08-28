import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_from_state.dart';
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
        child: AddNoteFromState(),
      ),
    );
  }
}
