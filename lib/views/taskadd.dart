import 'package:flutter/material.dart';

class TaskAddPage extends StatefulWidget {
  const TaskAddPage({super.key});

  @override
  State<TaskAddPage> createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Add"),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 30.0,
          ),
          Column(
            children: [
              //Todo name field
              Text(
                "Task Name",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Eg. To eat',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //ToDo date field
              Text(
                "Task Date",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Eg.  11/May/2023',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              Container(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Perform action when the button is pressed
                  },
                  child: const Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
