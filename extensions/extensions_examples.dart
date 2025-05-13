// File: extensions_examples.dart
// Purpose: Demonstrates the use of extensions in Dart
// Author: Dart Learning Project

/// This file showcases how to use extensions in Dart to add functionality to existing classes
/// without modifying their source code or creating a subclass.

/// Main function to run all extension examples
void main() {
  print('===== Extensions in Dart =====\n');
  
  print('1. Basic String Extensions:');
  basicStringExtensionExample();
  
  print('\n2. Extensions on Built-in Types:');
  builtInTypeExtensionsExample();
  
  print('\n3. Extensions with Operators:');
  operatorExtensionsExample();
  
  print('\n4. Extensions with Getters and Setters:');
  getterSetterExtensionsExample();
  
  print('\n5. Named Extensions:');
  namedExtensionsExample();
  
  print('\n6. Extension Scope and Conflicts:');
  extensionScopeExample();
  
  print('\n===== Extensions Examples Complete =====');
}

// Basic extension on String
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
  
  String get reversed => split('').reversed.join('');
  
  bool get isValidEmail => 
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
}

// Extension on int
extension IntExtension on int {
  int get squared => this * this;
  
  List<int> rangeTo(int end) {
    final result = <int>[];
    if (end >= this) {
      for (int i = this; i <= end; i++) {
        result.add(i);
      }
    } else {
      for (int i = this; i >= end; i--) {
        result.add(i);
      }
    }
    return result;
  }
}

// Extension with operators
extension VectorOperations on List<int> {
  List<int> operator +(List<int> other) {
    if (other.length != length) {
      throw ArgumentError('Vectors must have the same dimension');
    }
    
    return List.generate(length, (i) => this[i] + other[i]);
  }
  
  List<int> operator *(int scalar) {
    return List.generate(length, (i) => this[i] * scalar);
  }
}

// Extension with getters and setters
extension DateTimeExtension on DateTime {
  String get formattedDate => '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  
  DateTime get tomorrow => DateTime(year, month, day + 1);
  DateTime get yesterday => DateTime(year, month, day - 1);
  
  bool get isWeekend => weekday == DateTime.saturday || weekday == DateTime.sunday;
}

// Named extension for demonstration
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
  
  double parseDouble() {
    return double.parse(this);
  }
}

/// Demonstrates basic string extensions
void basicStringExtensionExample() {
  String name = 'dart';
  print('Original: $name');
  print('Capitalized: ${name.capitalize()}');
  print('Reversed: ${name.reversed}');
  
  String email = 'user@example.com';
  print('Is "$email" a valid email? ${email.isValidEmail}');
}

/// Demonstrates extensions on built-in types
void builtInTypeExtensionsExample() {
  int number = 5;
  print('$number squared is ${number.squared}');
  
  print('Range from 1 to 5: ${1.rangeTo(5)}');
  print('Range from 5 to 1: ${5.rangeTo(1)}');
}

/// Demonstrates extensions with operators
void operatorExtensionsExample() {
  List<int> v1 = [1, 2, 3];
  List<int> v2 = [4, 5, 6];
  
  print('v1: $v1');
  print('v2: $v2');
  print('v1 + v2: ${v1 + v2}');
  print('v1 * 2: ${v1 * 2}');
  
  try {
    List<int> v3 = [1, 2];
    print('v1 + v3: ${v1 + v3}'); // This will throw an error
  } catch (e) {
    print('Error: $e');
  }
}

/// Demonstrates extensions with getters and setters
void getterSetterExtensionsExample() {
  final now = DateTime.now();
  print('Current date: ${now.formattedDate}');
  print('Tomorrow: ${now.tomorrow.formattedDate}');
  print('Yesterday: ${now.yesterday.formattedDate}');
  print('Is today a weekend? ${now.isWeekend}');
}

/// Demonstrates named extensions
void namedExtensionsExample() {
  String numberStr = '42';
  print('Parsed as int: ${numberStr.parseInt()}');
  
  String doubleStr = '3.14';
  print('Parsed as double: ${doubleStr.parseDouble()}');
}

/// Demonstrates extension scope and conflict resolution
void extensionScopeExample() {
  print('Extensions are resolved at compile-time based on the static type of the expression');
  print('If there are conflicts between extensions, you need to use explicit extension application:');
  print('// StringExtension("example").capitalize();');
  
  print('\nExtensions are only visible if they are imported:');
  print('// import "string_extensions.dart";');
}