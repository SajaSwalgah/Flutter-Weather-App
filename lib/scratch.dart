import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task2();

  String task1Result = await task1();
  task3(task1Result);
}

Future<String> task1() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;
  await Future.delayed(threeSeconds, () {
    result = 'task 1 data';
    print('task1 completed');
  });

  return result;
}

void task2() {
  String result = 'task 2 data';
  print('task2 completed');
}

void task3(String task1Data) {
  String result = 'task 3 data';
  print('task3 completed with $task1Data');
}
