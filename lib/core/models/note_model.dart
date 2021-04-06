import 'package:flutter/cupertino.dart';

class Note {
  int id;
  String title;
  String note;
  String date;

  Note(
      {this.id,
      @required this.title,
      @required this.note,
      @required this.date});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> note = Map<String, dynamic>();
    note['id'] = this.id;
    note['title'] = this.title;
    note['note'] = this.note;
    note['date'] = this.date;
    return note;
  }
}
