import 'package:flutter/material.dart';
import 'package:flutter_note_app/core/controllers/note_controller.dart';
import 'package:flutter_note_app/core/models/note_model.dart';
import 'package:flutter_note_app/ui/styles/colors.dart';
import 'package:flutter_note_app/ui/styles/text_styles.dart';
import 'package:flutter_note_app/ui/widgets/icon_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddNotePage extends StatefulWidget {
  final bool isUpdate;
  final Note note;
  AddNotePage({this.isUpdate = false, this.note});

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController _titleTextController = TextEditingController();
  TextEditingController _noteTextController = TextEditingController();
  final NoteController _noteController = Get.find<NoteController>();
  DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    if (widget.isUpdate) {
      _titleTextController.text = widget.note.title;
      _noteTextController.text = widget.note.note;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            _body(),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyIconButton(
            onTap: () {
              Get.back();
            },
            icon: Icons.keyboard_arrow_left,
          ),
          MyIconButton(
            onTap: () {
              _validateInput();
            },
            txt: widget.isUpdate ? "Update" : "Save",
          ),
        ],
      ),
    );
  }

  _body() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleTextController,
            style: titleTextStyle,
            cursorColor: Colors.white,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              hintText: "Title",
              hintStyle: titleTextStyle.copyWith(color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: bgColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: bgColor),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _noteTextController,
            style: bodyTextStyle,
            cursorColor: Colors.white,
            minLines: 3,
            maxLines: 12,
            decoration: InputDecoration(
              hintText: "Type something...",
              hintStyle: bodyTextStyle,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: bgColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: bgColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validateInput() async {
    if (_titleTextController.text.isNotEmpty &&
        _noteTextController.text.isNotEmpty) {
      await _noteController
          .addNote(
            note: Note(
              note: _noteTextController.text,
              title: _titleTextController.text,
              date: DateFormat.yM().format(_currentDate).toString(),
            ),
          )
          .then((value) => Get.back());
    }
  }
}
