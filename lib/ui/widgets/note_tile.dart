import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/models/note_model.dart';
import 'package:flutter_note_app/ui/pages/note_detailed_page.dart';
import 'package:flutter_note_app/ui/styles/colors.dart';
import 'package:flutter_note_app/ui/styles/text_styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  final bool isBigTitle;
  NoteTile({@required this.note, this.isBigTitle = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          NoteDetailPage(note: note),
          transition: Transition.leftToRight,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: tileColors[note.id],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              child: Text(
                note.title,
                style:
                    noteTitleTextStyle.copyWith(fontSize: isBigTitle ? 26 : 22),
                //  overflow: TextOverflow.ellipsis,
                //maxLines: 4,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(DateFormat.yMd().format(note.date),
                    style: dateTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.7))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
