import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/adapters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<Map<String, dynamic>> _items = [];

  final _TODOCRUDHIVE = Hive.box("TODOCRUDHIVE");

  //init state/data method
  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  // Data refresh from hive storage method
  //this will work after adding data
  void _refreshItems() {
    final data = _TODOCRUDHIVE.keys.map((key) {
      final item = _TODOCRUDHIVE.get(key);
      return {"Key": key, "name": item["name"], "quantity": item["quantity"]};
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      //print(_items.length);
    });
  }

  // Data adding to hive storage method
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _TODOCRUDHIVE.add(newItem);
    _refreshItems();
    //print("Amound of data : ${_TODOCRUDHIVE.length}");
  }

  // Data update to hive storage method
  Future<void> _updateItem(int itemKey, Map<String, dynamic> itemUpdate) async {
    await _TODOCRUDHIVE.put(itemKey, itemUpdate);
    _refreshItems();
    //print("Amound of data : ${_TODOCRUDHIVE.length}");

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An item has been updated")));
  }

  // Data delete from hive storage method
  Future<void> _deleteItem(int itemKey) async {
    await _TODOCRUDHIVE.delete(itemKey);
    _refreshItems();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An item has been deleted")));
    //print("Amound of data : ${_TODOCRUDHIVE.length}");
  }

  // Form pop up method
  void _showForm(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['Key'] == itemKey);
      _nameController.text = existingItem['name'];
      _quantityController.text = existingItem['quantity'];
    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Quantity"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Adding data to hive storage
                      if (itemKey == null) {
                        _createItem({
                          "name": _nameController.text,
                          "quantity": _quantityController.text,
                        });
                      }

                      //for data update
                      if (itemKey != null) {
                        _updateItem(itemKey, {
                          "name": _nameController.text.trim(),
                          "quantity": _quantityController.text.trim(),
                        });
                      }

                      _nameController.text = "";
                      _quantityController.text = "";

                      Navigator.of(context).pop();
                    },
                    child: Text(itemKey == null ? "Create New" : "Update"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive"),
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final currentItem = _items[index];
            return Card(
              color: Colors.orange.shade100,
              margin: const EdgeInsets.all(10),
              elevation: 3,
              child: ListTile(
                title: Text(currentItem['name']),
                subtitle: Text(currentItem['quantity'].toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Edit button
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => {_showForm(context, currentItem['Key'])},
                    ),
                    //Delete button
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => {_deleteItem(currentItem['Key'])},
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
