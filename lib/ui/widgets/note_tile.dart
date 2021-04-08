import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/models/note_model.dart';
import 'package:flutter_note_app/ui/pages/note_detailed_page.dart';
import 'package:flutter_note_app/ui/styles/colors.dart';
import 'package:flutter_note_app/ui/styles/text_styles.dart';
import 'package:get/get.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  NoteTile({
    @required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => NoteDetailPage(note: note),
          transition: Transition.leftToRight,
        );
      },
      child: Container(
        // margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: tileColors[note.id % 7],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                note.title,
                maxLines: 2,
                style: noteTitleTextStyle.copyWith(
                  fontSize: 22,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              child: Text(
                note.note,
                maxLines: 4,
                style: noteTitleTextStyle.copyWith(
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(note.date,
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
