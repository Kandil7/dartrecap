
// File: main.dart
// Purpose: Main entry point for the Dart learning project
// Author: Dart Learning Project

/// This file serves as the main entry point for the Dart learning project.
/// It provides access to all the different modules and examples.

// Import all module examples
import 'async/async_examples.dart' as async;
import 'best_practices/dart_best_practices.dart' as best_practices;
import 'classes/colors.dart';
import 'classes/fraction.dart';
import 'classes/person.dart';
import 'classes/test_class.dart';
import 'classes/vehlice.dart';
import 'collections/collections_examples.dart' as collections;
import 'design_patterns/design_patterns_examples.dart' as design_patterns;
import 'error_handling/error_handling_examples.dart' as error_handling;
import 'extensions/extensions_examples.dart' as extensions;
import 'function_recap/function_recap.dart' as functions;
import 'mixins/mixins_examples.dart' as mixins;
import 'null_safety/null_safety_examples.dart' as null_safety;

/// Main function that serves as the entry point for the application
void main() {
  printHeader('DART LEARNING PROJECT');
  printModuleOptions();
  
  // For demonstration purposes, we'll run the OOP examples
  // In a real application, you might use user input to determine which module to run
  runOopExamples();
  
  printFooter();
  
  // Uncomment any of these lines to run different modules
  // async.main();
  // best_practices.main();
  // collections.main();
  // design_patterns.main();
  // error_handling.main();
  // extensions.main();
  // functions.callMain();
  // mixins.main();
  // null_safety.main();
}

/// Prints a formatted header with the given title
void printHeader(String title) {
  print('\n' + '=' * 50);
  print(' ' * ((50 - title.length) ~/ 2) + title);
  print('=' * 50);
}

/// Prints a formatted footer
void printFooter() {
  print('\n' + '=' * 50);
  print(' ' * 15 + 'END OF EXAMPLES');
  print('=' * 50);
}

/// Prints the available module options
void printModuleOptions() {
  print('\nAvailable Learning Modules:');
  print('1. Object-Oriented Programming (OOP)');
  print('2. Functions and Functional Programming');
  print('3. Collections and Generics');
  print('4. Asynchronous Programming');
  print('5. Error Handling');
  print('6. Dart Best Practices');
  print('7. Extensions');
  print('8. Mixins');
  print('9. Null Safety');
  print('10. Design Patterns');
  print('\nTo run a specific module, uncomment the corresponding line in main()\n');
}

/// Runs the Object-Oriented Programming examples
void runOopExamples() {
  printHeader('OBJECT-ORIENTED PROGRAMMING EXAMPLES');
  
  print('\n1. Basic Class and Cascade Notation:');
  Test test = Test(22, 3.8);
  
  print('Initial values:');
  print('val1: ${test.val1}');
  print('val2: ${test.val2}');
  
  print('\nAssigning values (traditional way):');
  test.val1 = "one_1";
  test.val2 = "two_2";
  print('val1: ${test.val1}');
  print('val2: ${test.val2}');
  
  print('\nAssigning values (cascade notation):');
  test..val1 = 'one_1_cascade'
       ..val2 = 'two_2_cascade';
  print('val1: ${test.val1}');
  print('val2: ${test.val2}');
  
  print('\nCalling methods with cascade notation:');
  test..randomValue()
       ..randomValue()
       ..randomValue();
  print('Random value: ${test.randomValue()}');
  
  print('\n2. Constructors:');
  print('\nNamed Constructors:');
  var value1 = MyFraction(0, 1);
  print('Regular constructor - denominator: ${value1.denominator}');
  
  var value2 = MyFraction.zero();
  print('Named constructor .zero() - denominator: ${value2.denominator}');
  
  print('\nRedirecting Constructors:');
  var value3 = MyFraction.oneHalf();
  print('Redirecting constructor .oneHalf() - numerator: ${value3.numerator}, denominator: ${value3.denominator}');
  
  var value4 = MyFraction.whole(4);
  print('Redirecting constructor .whole(4) - numerator: ${value4.numerator}, denominator: ${value4.denominator}');
  
  print('\n3. Factory Constructors and Object Caching:');
  var person1 = Person('Ahmed');
  var person2 = Person('Ahmed');
  print('person1 == person2: ${person1 == person2}');
  
  var car = Vehicle.cache('car');
  var bike = Vehicle.cache('bike');
  print('car: $car');
  print('bike: $bike');
  
  var red1 = ColorObject(ColorType.red);
  var red2 = ColorObject(ColorType.red);
  print('red1 == red2: ${red1 == red2}');
  print('red1: $red1');
  print('red2: $red2');
}