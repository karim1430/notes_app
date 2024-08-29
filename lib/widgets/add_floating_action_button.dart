import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_from_state.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNotefailer) {
              print('failed error is ${state.errMessage}');
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('done added note')));
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              // make stop screen as AddNoteloading
              absorbing: state is AddNoteLoading ? true : false,
              child: SingleChildScrollView(
                child: const AddNoteFromState(),
              ),
            );
          },
        ),
      ),
    );
  }
}
