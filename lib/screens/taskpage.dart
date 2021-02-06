import 'package:flutter/material.dart';
import 'package:flutter_todo/database_helper.dart';
import 'package:flutter_todo/models/task.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets.dart';

class Taskpage extends StatefulWidget {
  final Task task;
  Taskpage({@required this.task});

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  String _taskTitle = '';
  String _taskDescription = '';
  int _taskId = 0;

  FocusNode _titleFocus;
  FocusNode _descriptionFocus;
  FocusNode _todoFocus;

  String _todoText = '';

  bool _contentVisible = false;

  var _controller = TextEditingController();

  @override
  void dispose() {
    _titleFocus.dispose();
    _descriptionFocus.dispose();
    _todoFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.task != null) {
      // Set visibility to true
      _contentVisible = true;

      this._taskTitle = widget.task.title;
      this._taskDescription = widget.task.description;
      this._taskId = widget.task.id;
    }

    _titleFocus = FocusNode();
    _descriptionFocus = FocusNode();
    _todoFocus = FocusNode();

    print('ID: ${widget.task?.id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/back_arrow_icon.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: _titleFocus,
                            onSubmitted: (value) async {
                              // Check if the field is not empty
                              if (value != '') {
                                // Check if the task is null
                                if (widget.task == null) {
                                  Task _newTask = Task(
                                    title: value,
                                  );

                                  _taskId =
                                      await _dbHelper.insertTask(_newTask);
                                  setState(() {
                                    _contentVisible = true;
                                    _taskTitle = value;
                                  });
                                  print('New Task Id: $_taskId');
                                } else {
                                  await _dbHelper.updateTaskTitle(
                                      _taskId, value);
                                  setState(() {
                                    _taskTitle = value;
                                  });
                                  print('Update the existing task');
                                }

                                _descriptionFocus.requestFocus();
                              }
                            },
                            controller: TextEditingController()
                              ..text = _taskTitle,
                            decoration: InputDecoration(
                              hintText: 'Enter Task Title.....',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF211551),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: TextField(
                      focusNode: _descriptionFocus,
                      onSubmitted: (value) async {
                        if (value != "") {
                          if (_taskId != 0) {
                            await _dbHelper.updateTaskDescription(
                                _taskId, value);
                            _taskDescription = value;
                            // setState(() {});
                          }
                        }
                        _todoFocus.requestFocus();
                      },
                      controller: TextEditingController()
                        ..text = _taskDescription,
                      decoration: InputDecoration(
                        hintText: 'Enter Description for the task....',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _contentVisible,
                    child: FutureBuilder(
                      initialData: [],
                      future: _dbHelper.getTodo(_taskId),
                      builder: (context, snapshot) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  await _dbHelper.updateTodoDone(
                                      snapshot.data[index].id,
                                      snapshot.data[index].isDone == 0 ? 1 : 0);
                                  setState(() {});
                                },
                                child: TodoWidget(
                                  text: snapshot.data[index].title,
                                  isDone: snapshot.data[index].isDone == 1,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: _contentVisible,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 20.0,
                                  height: 20.0,
                                  margin: EdgeInsets.only(
                                    right: 12.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                      color: Color(0xFF86829D),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/check_icon.png'),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _controller..text = '',
                                    focusNode: _todoFocus,
                                    onSubmitted: (value) async {
                                      if (value != '') {
                                        // Check if the task is null
                                        if (_taskId != 0) {
                                          Todo _newTodo = Todo(
                                            taskId: _taskId,
                                            title: value,
                                            isDone: 0,
                                          );

                                          await _dbHelper.insertTodo(_newTodo);
                                          setState(() {
                                            _todoFocus.requestFocus();
                                          });
                                        } else {
                                          print("""Task doesn't exist""");
                                        }
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Enter Todo item....',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: _contentVisible,
                child: Positioned(
                  bottom: 24.0,
                  right: 24.0,
                  child: GestureDetector(
                    onTap: () async {
                      await _dbHelper.deleteTask(_taskId);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Color(0xFFFE3577),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Image(
                        image: AssetImage("assets/images/delete_icon.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
