import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.person),
        title: Text(
          "         Task Management",
          textAlign: TextAlign.center,
          style: TextStyle(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Image.network(
                    "https://th.bing.com/th/id/OIP.9GAQcfixiScbz3oXYVqNhQHaID?pid=ImgDet&rs=1",
                    width: 100,
                    height: 100,
                  ),
                  // Text(
                  //   'Lord Doge',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 24,
                  //   ),
                  // ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name : Min Thant Kyaw'),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email : wanderhobby@gmail.com'),
              onTap: () {
                // Add your navigation logic here
              },
            ),
            Container(
              width: 200,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add your button functionality here
                },
                label: Text('Logout'),
                icon: Icon(Icons.edit), // Replace with your desired icon
                // Replace with your desired text
              ),
            ),
          ],
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 20),
              width: 140,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add your button functionality here
                },
                label: Text('Add Task'),
                icon: Icon(Icons.add), // Replace with your desired icon
                // Replace with your desired text
              ),
            )
          ],
        ),
        ToDoItem(todoName: "To buy groceries", todoDate: "10/May/2023"),
        ToDoItem(todoName: "Check gmail", todoDate: "11/May/2023"),
        ToDoItem(todoName: "Hangout with fri", todoDate: "12/May/2023"),
        ToDoItem(todoName: "To attend dinner", todoDate: "10/May/2023"),
      ]),
    );
  }
}

class ToDoItem extends StatelessWidget {
  final String todoName;
  final String todoDate;

  const ToDoItem({
    super.key,
    required this.todoName,
    required this.todoDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: 360,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  this.todoName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  this.todoDate,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   width: 70,
          // ),
          Column(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Add your button functionality here
                },
                label: Text('     Edit'),
                icon: Icon(Icons.edit), // Replace with your desired icon
                // Replace with your desired text
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Add your button functionality here
                },
                label: Text('Delete'),
                icon: Icon(Icons.delete), // Replace with your desired icon
                // Replace with your desired text
              ),
            ],
          ),
        ],
      ),
    );
  }
}
