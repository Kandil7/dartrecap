// File: collections_examples.dart
// Purpose: Demonstrates collection types and generic programming in Dart
// Author: Dart Learning Project

/// This file contains examples of Dart's collection types (List, Set, Map)
/// and demonstrates generic programming concepts.

// Main function to run all collection examples
void main() {
  print('===== Collections and Generics in Dart =====\n');
  
  print('1. List Examples:');
  listExamples();
  
  print('\n2. Set Examples:');
  setExamples();
  
  print('\n3. Map Examples:');
  mapExamples();
  
  print('\n4. Generic Programming:');
  genericExamples();
  
  print('\n5. Collection Operations:');
  collectionOperations();
  
  print('\n===== Collections Examples Complete =====');
}

/// Demonstrates List creation and operations
/// 
/// Lists are ordered collections of objects with a zero-based index
void listExamples() {
  // List creation methods
  print('Different ways to create Lists:');
  
  // Using literals
  List<String> fruits = ['apple', 'banana', 'orange'];
  print('Literal syntax: $fruits');
  
  // Using constructor
  List<int> numbers = List<int>.filled(3, 0);
  print('Using constructor: $numbers');
  
  // Using from() factory
  List<String> fruitsCopy = List<String>.from(fruits);
  print('Using from(): $fruitsCopy');
  
  // Using generate() factory
  List<int> squares = List<int>.generate(5, (index) => index * index);
  print('Using generate(): $squares');
  
  // List operations
  print('\nList operations:');
  
  // Adding elements
  fruits.add('grape');
  print('After add(): $fruits');
  
  // Inserting at specific position
  fruits.insert(1, 'mango');
  print('After insert(): $fruits');
  
  // Removing elements
  fruits.remove('banana');
  print('After remove(): $fruits');
  
  // Accessing elements
  print('First element: ${fruits.first}');
  print('Last element: ${fruits.last}');
  print('Element at index 2: ${fruits[2]}');
  
  // Checking conditions
  print('Is empty? ${fruits.isEmpty}');
  print('Length: ${fruits.length}');
  print('Contains "mango"? ${fruits.contains("mango")}');
  
  // Iterating
  print('\nIterating through a List:');
  for (var fruit in fruits) {
    print('- $fruit');
  }
  
  // Using forEach
  print('\nUsing forEach:');
  fruits.forEach((fruit) => print('* $fruit'));
}

/// Demonstrates Set creation and operations
/// 
/// Sets are unordered collections of unique objects
void setExamples() {
  // Set creation methods
  print('Different ways to create Sets:');
  
  // Using literals
  Set<String> colors = {'red', 'green', 'blue'};
  print('Literal syntax: $colors');
  
  // Using constructor
  Set<int> numbers = Set<int>();
  numbers.addAll([1, 2, 3, 3, 4]); // Note: duplicates are automatically removed
  print('Using constructor: $numbers');
  
  // Using from() factory
  Set<String> colorsCopy = Set<String>.from(colors);
  print('Using from(): $colorsCopy');
  
  // Set operations
  print('\nSet operations:');
  
  Set<String> primaryColors = {'red', 'blue', 'yellow'};
  Set<String> secondaryColors = {'purple', 'green', 'orange'};
  
  // Union
  Set<String> allColors = primaryColors.union(secondaryColors);
  print('Union: $allColors');
  
  // Intersection
  Set<String> commonColors = colors.intersection(primaryColors);
  print('Intersection: $commonColors');
  
  // Difference
  Set<String> uniqueColors = primaryColors.difference(colors);
  print('Difference: $uniqueColors');
  
  // Adding and removing elements
  colors.add('yellow');
  print('After add(): $colors');
  
  colors.remove('green');
  print('After remove(): $colors');
  
  // Checking conditions
  print('Contains "blue"? ${colors.contains("blue")}');
  print('Length: ${colors.length}');
}

/// Demonstrates Map creation and operations
/// 
/// Maps are collections of key-value pairs
void mapExamples() {
  // Map creation methods
  print('Different ways to create Maps:');
  
  // Using literals
  Map<String, int> ages = {
    'John': 30,
    'Alice': 25,
    'Bob': 35,
  };
  print('Literal syntax: $ages');
  
  // Using constructor
  Map<String, double> prices = Map<String, double>();
  prices['apple'] = 1.99;
  prices['banana'] = 0.99;
  print('Using constructor: $prices');
  
  // Using fromEntries() factory
  var entries = [
    MapEntry('en', 'English'),
    MapEntry('es', 'Spanish'),
    MapEntry('fr', 'French'),
  ];
  Map<String, String> languages = Map.fromEntries(entries);
  print('Using fromEntries(): $languages');
  
  // Map operations
  print('\nMap operations:');
  
  // Adding or updating entries
  ages['Charlie'] = 40;
  print('After adding "Charlie": $ages');
  
  ages['John'] = 31; // Update existing value
  print('After updating "John": $ages');
  
  // Removing entries
  ages.remove('Bob');
  print('After removing "Bob": $ages');
  
  // Accessing values
  print('Age of Alice: ${ages["Alice"]}');
  print('Age of David (not in map): ${ages["David"]}'); // Returns null
  
  // Safe access with default value
  print('Age of David (with default): ${ages["David"] ?? 0}');
  
  // Checking conditions
  print('Contains key "Alice"? ${ages.containsKey("Alice")}');
  print('Contains value 25? ${ages.containsValue(25)}');
  print('Is empty? ${ages.isEmpty}');
  print('Length: ${ages.length}');
  
  // Iterating
  print('\nIterating through a Map:');
  ages.forEach((name, age) => print('$name is $age years old'));
  
  print('\nKeys: ${ages.keys}');
  print('Values: ${ages.values}');
  print('Entries: ${ages.entries.map((e) => "${e.key}: ${e.value}")}');
}

/// Demonstrates generic programming concepts
/// 
/// Generics allow for type-safe code that works with different types
void genericExamples() {
  // Generic class examples
  print('Generic class examples:');
  
  // Create a Box that holds an int
  Box<int> intBox = Box<int>(42);
  print('intBox value: ${intBox.value}');
  
  // Create a Box that holds a String
  Box<String> stringBox = Box<String>('Hello Generics');
  print('stringBox value: ${stringBox.value}');
  
  // Generic method examples
  print('\nGeneric method examples:');
  
  List<int> numbers = [1, 2, 3, 4, 5];
  print('First element: ${first<int>(numbers)}');
  
  List<String> words = ['apple', 'banana', 'cherry'];
  print('First element: ${first<String>(words)}');
  
  // Pair example (multiple type parameters)
  print('\nMultiple type parameters:');
  Pair<String, int> person = Pair<String, int>('Alice', 30);
  print('Person: ${person.first} is ${person.second} years old');
  
  // Type constraints example
  print('\nType constraints:');
  NumberBox<int> intNumberBox = NumberBox<int>(123);
  print('intNumberBox value: ${intNumberBox.value}');
  
  NumberBox<double> doubleNumberBox = NumberBox<double>(3.14);
  print('doubleNumberBox value: ${doubleNumberBox.value}');
  
  // This would cause a compile-time error:
  // NumberBox<String> stringNumberBox = NumberBox<String>('not a number');
}

/// Demonstrates common collection operations
/// 
/// Shows functional-style operations on collections
void collectionOperations() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Mapping
  List<int> doubled = numbers.map((n) => n * 2).toList();
  print('Doubled numbers: $doubled');
  
  // Filtering
  List<int> evens = numbers.where((n) => n % 2 == 0).toList();
  print('Even numbers: $evens');
  
  // Reducing
  int sum = numbers.reduce((value, element) => value + element);
  print('Sum of numbers: $sum');
  
  // Folding (with initial value)
  int sumPlusTen = numbers.fold(10, (sum, element) => sum + element);
  print('Sum plus 10: $sumPlusTen');
  
  // Any and every
  bool hasEven = numbers.any((n) => n % 2 == 0);
  print('Has even numbers? $hasEven');
  
  bool allPositive = numbers.every((n) => n > 0);
  print('All positive? $allPositive');
  
  // Take and skip
  List<int> firstThree = numbers.take(3).toList();
  print('First three: $firstThree');
  
  List<int> afterFirstThree = numbers.skip(3).toList();
  print('After first three: $afterFirstThree');
  
  // Sorting
  List<int> unsorted = [5, 2, 8, 1, 9, 3];
  unsorted.sort();
  print('Sorted: $unsorted');
  
  // Custom sorting
  List<String> names = ['Alice', 'Bob', 'Charlie', 'David'];
  names.sort((a, b) => b.compareTo(a)); // Descending order
  print('Names in descending order: $names');
}

/// A generic class that can hold any type of value
class Box<T> {
  final T value;
  
  Box(this.value);
  
  @override
  String toString() => 'Box<$T>($value)';
}

/// A generic class with multiple type parameters
class Pair<A, B> {
  final A first;
  final B second;
  
  Pair(this.first, this.second);
  
  @override
  String toString() => 'Pair<$A, $B>($first, $second)';
}

/// A generic class with a type constraint
/// 
/// T must be a number type (int, double, etc.)
class NumberBox<T extends num> {
  final T value;
  
  NumberBox(this.value);
  
  // We can perform numeric operations because T is constrained to num
  T square() => (value * value) as T;
  
  @override
  String toString() => 'NumberBox<$T>($value)';
}

/// A generic method that returns the first element of a list
/// 
/// Returns null if the list is empty
T? first<T>(List<T> list) {
  return list.isNotEmpty ? list.first : null;
}