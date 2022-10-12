class Note {
  String title;
  String text;
  String date;
  int? id;

  Note({
    this.id,
    required this.title,
    required this.text,
    required this.date,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      text: json['note'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> note = <String, dynamic>{};
    note['title'] = title;
    note['note'] = text;
    note['date'] = date;
    return note;
  }
}
