import 'dart:io';

void main() async {
  final file = File('passwords.txt');
  final rotations = await file.readAsLines();

  int startPosition = 50;
  int count = 0;

  for (String rotation in rotations) {
    String dir = rotation[0];
    int number = int.parse(rotation.substring(1));

    if (dir == 'R') {
      startPosition = (startPosition + number) % 100;
    } else {
      startPosition = (startPosition - number) % 100;
      if (startPosition < 0) startPosition += 100;
    }
    if (startPosition == 0) {
      count++;
    }
  }
  print("Password = $count");
}
