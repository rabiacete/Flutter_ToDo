import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo2/constants/color.dart';
import 'package:todo2/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['Flutter çalış', true],
    ['İngilizce çalış', true],
    ['Arkadaşını ara', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(backroundColor),
      appBar: AppBar(
        title: const Text(
          '✎Yapılacaklar ˎˊ˗',
        ),
        backgroundColor: HexColor(appBarBackgroundColor), //appBar back color
        foregroundColor: Colors.white,  //appBardaki textin rengi
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (contex) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Yeni Görev Ekle',
                    filled: true,
                    fillColor: HexColor(fillColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                      color: HexColor(appBarBackgroundColor),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: HexColor(buttonColor), // Düğmenin arka plan rengi
              onPressed: saveNewTask,
              child: const Icon(Icons.add,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}