import 'package:flutter/widgets.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list_view.dart';

class EditColorToListView extends StatefulWidget {
  const EditColorToListView({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditColorToListView> createState() => _EditColorToListViewState();
}

class _EditColorToListViewState extends State<EditColorToListView> {
  List<Color> color = [
    const Color(0xffD7D9D7),
    const Color(0xffC9C5CB),
    const Color(0xffBAACBD),
    const Color(0xffB48EAE),
    const Color(0xff646E68),
  ];
  late int currentIdex;
  @override
  void initState() {
    currentIdex = color.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 38,
      child: ListView.builder(
        itemCount: color.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                currentIdex = index;

                widget.note.color = color[index].value;

                setState(() {});
              },
              child: ColorItem(
                isActive: currentIdex == index,
                color: color[index],
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
