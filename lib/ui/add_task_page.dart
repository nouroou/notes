import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes/controllers/task_controller.dart';
import 'package:notes/models/task.dart';
import 'package:notes/ui/theme.dart';
import 'package:notes/ui/widgets/button.dart';
import 'package:notes/ui/widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = "9:30 AM";
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 30, 60];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly', 'Yearly'];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: headingStyle,
              ),
              InputField(
                inputTitle: 'Title',
                inputHint: 'Enter title here',
                controller: _titleController,
              ),
              InputField(
                inputTitle: 'Note',
                inputHint: 'Enter note here',
                controller: _noteController,
              ),
              InputField(
                  inputTitle: 'Date',
                  inputHint: DateFormat.yMd().format(_selectedDate).toString(),
                  inputIcon: InkWell(
                    child: const Icon(Icons.date_range_outlined),
                    onTap: () {
                      _getDateFromUser(context);
                    },
                  )),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InputField(
                        inputTitle: 'Start Time',
                        inputHint: _startTime,
                        inputIcon: InkWell(
                          child: const Icon(Icons.access_time),
                          onTap: () {
                            _getTimeFromUser(isStartTime: true);
                          },
                        )),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: InputField(
                        inputTitle: 'End Time',
                        inputHint: _endTime,
                        inputIcon: InkWell(
                          child: const Icon(Icons.access_time),
                          onTap: () {
                            _getTimeFromUser(isStartTime: false);
                          },
                        )),
                  ),
                ],
              ),
              InputField(
                  inputTitle: 'Remind',
                  inputHint: '$_selectedRemind minutes early',
                  inputIcon: DropdownButton(
                    borderRadius: BorderRadius.circular(16),
                    underline: Container(height: 0),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 4,
                    style: subtitleStyle,
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRemind = int.parse(value!);
                      });
                    },
                  )),
              InputField(
                  inputTitle: 'Repeat',
                  inputHint: _selectedRepeat,
                  inputIcon: DropdownButton(
                    borderRadius: BorderRadius.circular(16),
                    underline: Container(height: 0),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 4,
                    style: subtitleStyle,
                    items: repeatList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRepeat = value!;
                      });
                    },
                  )),
              const SizedBox(height: 12),
              _taskBottomBar()
            ],
          ),
        ),
      ),
    );
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDB();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar('Required', 'All fields are required',
          backgroundColor: reddish,
          colorText: Colors.white,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  _addTaskToDB() async {
    int value = await _taskController.addTask(
        task: Task(
      color: _selectedColor,
      title: _titleController.text,
      note: _noteController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      remind: _selectedRemind,
      repeat: _selectedRepeat,
      isCompleted: 0,
    ));
    print("ID IS: $value");
  }

  _appBar() {
    return AppBar(
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
      actions: [
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            child: const Icon(
              Icons.person_outline_rounded,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }

  _getDateFromUser(BuildContext context) async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2099));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print('Null Date Something Went Wrong');
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    var formattedTime;
    if (pickedTime != null) formattedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print('Time is null');
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formattedTime;
      });
    }
  }

  _taskColor() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: titleStyle),
        const SizedBox(height: 8),
        Wrap(
            children: List<Widget>.generate(
                3,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: index == 0
                              ? colorPrimary
                              : index == 1
                                  ? reddish
                                  : yellowish,
                          child: index == _selectedColor
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 16,
                                )
                              : Container(),
                        ),
                      ),
                    )))
      ],
    );
  }

  _taskBottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _taskColor(),
        Button(
          text: 'Create Task',
          onTap: () => _validateData(),
          icon: null,
        )
      ],
    );
  }

  _showTimePicker() {
    return showTimePicker(
            context: context,
            initialTime: TimeOfDay(
                hour: int.parse(_startTime.split(':')[0]),
                minute: int.parse(_startTime.split(':')[1].split(' ')[0])))
        .catchError((e) {
      print(e);
    });
  }
}
