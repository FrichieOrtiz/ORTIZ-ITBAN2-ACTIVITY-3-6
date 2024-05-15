class Stack<T> {
  List<T> _items = [];

  // Pushes an item onto the stack
  void push(T item) {
    _items.add(item);
  }

  // Pops an item from the stack
  T? pop() {
    if (isEmpty()) {
      return null;
    }
    return _items.removeLast();
  }

  // Checks if the stack is empty
  bool isEmpty() {
    return _items.isEmpty;
  }
}

void main() {
  // Creating a stack of integers
  Stack<int> stack = Stack<int>();

  // Pushing elements onto the stack
  stack.push(5);
  stack.push(10);
  stack.push(15);

  // Popping elements from the stack and printing them
  print('Popped element: ${stack.pop()}'); // Output: Popped element: 15
  print('Popped element: ${stack.pop()}'); // Output: Popped element: 10
  print('Popped element: ${stack.pop()}'); // Output: Popped element: 5

  // Checking if the stack is empty
  print('Is the stack empty: ${stack.isEmpty()}'); // Output: Is the stack empty: true
}
