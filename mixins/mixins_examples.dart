// File: mixins_examples.dart
// Purpose: Demonstrates the use of mixins in Dart
// Author: Dart Learning Project

/// This file showcases how to use mixins in Dart to reuse code across multiple class hierarchies
/// without using inheritance. Mixins are a way of reusing a class's code in multiple class hierarchies.

import 'dart:math' show Random;

/// Main function to run all mixin examples
void main() {
  print('===== Mixins in Dart =====\n');
  
  print('1. Basic Mixin Usage:');
  basicMixinExample();
  
  print('\n2. Mixin Constraints:');
  mixinConstraintsExample();
  
  print('\n3. Mixin with Methods:');
  mixinWithMethodsExample();
  
  print('\n4. Multiple Mixins:');
  multiMixinExample();
  
  print('\n5. Mixin on Specific Class:');
  mixinOnSpecificClassExample();
  
  print('\n===== Mixins Examples Complete =====');
}

// Basic mixin definition
mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

// Another mixin for demonstration
mixin Validator {
  bool validate(String value) {
    return value.isNotEmpty;
  }
}

// Mixin that requires specific functionality
mixin MusicalPerformer on Musician {
  void perform() {
    print('Performing ${playInstrument()}');
  }
}

// Base class for the 'on' constraint example
class Musician {
  String playInstrument() {
    return 'music';
  }
}

// Class using a mixin
class User with Logger {
  String name;
  
  User(this.name);
  
  void saveData() {
    log('Saving data for $name');
    // Save data logic would go here
  }
}

// Class using multiple mixins
class DataProcessor with Logger, Validator {
  void processData(String data) {
    if (validate(data)) {
      log('Processing valid data: $data');
      // Process data logic would go here
    } else {
      log('Invalid data, cannot process');
    }
  }
}

// Class using a mixin with the 'on' constraint
class Guitarist extends Musician with MusicalPerformer {
  @override
  String playInstrument() {
    return 'guitar solo';
  }
}

/// Demonstrates basic mixin usage
void basicMixinExample() {
  final user = User('John');
  user.saveData();
  
  // Direct access to mixin methods
  user.log('This is a direct log message');
}

/// Demonstrates mixin constraints
void mixinConstraintsExample() {
  print('Mixins cannot be instantiated directly:');
  print('// Logger logger = Logger(); // This would cause an error');
  
  print('\nMixins can be applied to classes using the "with" keyword:');
  print('// class MyClass with Logger {}');
}

/// Demonstrates a mixin with methods
void mixinWithMethodsExample() {
  final processor = DataProcessor();
  processor.processData('Sample data');
  processor.processData(''); // This will be invalid
}

/// Demonstrates using multiple mixins
void multiMixinExample() {
  final processor = DataProcessor();
  
  print('DataProcessor has Logger methods: ${processor is Logger}');
  print('DataProcessor has Validator methods: ${processor is Validator}');
  
  // Using methods from both mixins
  if (processor.validate('test')) {
    processor.log('Validation passed');
  }
}

/// Demonstrates using a mixin with the 'on' constraint
void mixinOnSpecificClassExample() {
  final guitarist = Guitarist();
  guitarist.perform();
  
  print('\nThe "on" keyword restricts which classes can use the mixin:');
  print('// mixin MusicalPerformer on Musician { ... }');
  print('// This means only Musician or its subclasses can use this mixin');
}