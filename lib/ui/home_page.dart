import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notes/services/notifications_services.dart';
import 'package:notes/services/theme_service.dart';
import 'package:notes/ui/add_task_page.dart';
import 'package:notes/ui/theme.dart';
import 'package:notes/ui/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  DateTime _selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Theme.of(context).primaryColor,
        selectedTextColor: buttonStyle.color as Color,
        dayTextStyle: unselectedStyle,
        dateTextStyle: unselectedStyle,
        monthTextStyle: unselectedStyle,
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                'Today',
                style: headingStyle,
              )
            ],
          ),
          Button(
            text: 'Add Task',
            icon: Icons.add,
            onTap: () => Get.to(() => const AddTaskPage()),
          )
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: IconButton(
          icon: Icon(Get.isDarkMode
              ? Icons.wb_sunny_outlined
              : Icons.mode_night_outlined),
          onPressed: () {
            ThemeService().switchTheme();
            notifyHelper.displayNotification(
                title: 'Theme Changed',
                body: Get.isDarkMode
                    ? "Activated Light Theme"
                    : "Activated Dark Theme");
          }),
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
}
