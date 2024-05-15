import 'dart:io';

void main() {
  // Define input and output file paths
  String inputFile = 'ortiz.txt';  // Make sure your file is named 'input.txt'
  String outputFile = 'output.txt';

  // Read numbers from input file
  File(inputFile).readAsString().then((String contents) {
    List<String> lines = contents.trim().split('\n');
    List<int> numbers = [];

    for (var line in lines) {
      List<String> numberStrings = line.split(',');
      for (var numberString in numberStrings) {
        numbers.add(int.parse(numberString.trim()));
      }
    }

    // Calculate sum
    int sum = numbers.fold(0, (prev, element) => prev + element);

    // Write sum to output file
    File(outputFile).writeAsString(sum.toString()).then((_) {
      print('Sum calculated and written to $outputFile');
    }).catchError((error) {
      print('Error writing to file: $error');
    });
  }).catchError((error) {
    print('Error reading file: $error');
  });
}
