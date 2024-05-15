import 'dart:io';

void main() {
  // Prompting the user for the file name
  stdout.write('Enter the file name: ');
  String? fileName = stdin.readLineSync();

  try {
    if (fileName == null) {
      throw Exception('File name cannot be null');
    }

    // Attempting to open and read the file
    File file = File(fileName);
    if (!file.existsSync()) {
      throw FileSystemException("File not found: $fileName");
    }

    // Reading file contents
    List<String> lines = file.readAsLinesSync();

    // Printing file contents
    print('File Contents:');
    for (String line in lines) {
      print(line);
    }
  } on FileSystemException catch (e) {
    // Handling file I/O errors
    print('Error: ${e.message}');
  } catch (e) {
    // Handling other unexpected errors
    print('An unexpected error occurred: $e');
  }
}
