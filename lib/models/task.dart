class Task {
  late int? id, isCompleted, color, remind;
  late String? title, note, date, startTime, endTime, repeat;

  Task(
      {this.id,
      this.isCompleted,
      required this.color,
      this.remind,
      required this.title,
      this.note,
      this.date,
      this.startTime,
      this.endTime,
      this.repeat});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isCompleted = json['isCompleted'];
    color = json['color'];
    remind = json['remind'];
    title = json['title'];
    note = json['note'];
    date = json['date'];
    repeat = json['repeat'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isComplete'] = isCompleted;
    data['remind'] = remind;
    data['color'] = color;
    data['title'] = title;
    data['note'] = note;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['repeat'] = repeat;
    return data;
  }
}
