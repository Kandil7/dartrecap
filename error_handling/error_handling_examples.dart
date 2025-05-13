// File: error_handling_examples.dart
// Purpose: Demonstrates error handling concepts and best practices in Dart
// Author: Dart Learning Project

/// This file contains examples of error handling in Dart,
/// including try/catch blocks, custom exceptions, and best practices.

// Main function to run all error handling examples
void main() {
  print('===== Error Handling in Dart =====\n');
  
  print('1. Basic Try/Catch Example:');
  basicTryCatchExample();
  
  print('\n2. Multiple Catch Blocks:');
  multipleCatchExample();
  
  print('\n3. Finally Block:');
  finallyBlockExample();
  
  print('\n4. Custom Exceptions:');
  customExceptionExample();
  
  print('\n5. Rethrowing Exceptions:');
  try {
    rethrowExample();
  } catch (e) {
    print('Caught in main: $e');
  }
  
  print('\n6. Stack Traces:');
  stackTraceExample();
  
  print('\n7. Error Handling Best Practices:');
  bestPracticesExample();
  
  print('\n===== Error Handling Examples Complete =====');
}

/// Demonstrates basic try/catch error handling
/// 
/// Shows how to catch and handle exceptions
void basicTryCatchExample() {
  try {
    // Attempting to divide by zero
    int result = 10 ~/ 0; // The ~/ operator performs integer division
    print('Result: $result'); // This line won't execute
  } catch (e) {
    print('An error occurred: $e');
  }
  
  print('Program continues after the error');
}

/// Demonstrates catching different types of exceptions
/// 
/// Shows how to handle different exception types with specific catch blocks
void multipleCatchExample() {
  try {
    // Uncomment one of these lines to test different exceptions
    // int result = 10 ~/ 0; // Throws IntegerDivisionByZeroException
    // List<int> numbers = [1, 2, 3]; print(numbers[10]); // Throws RangeError
    dynamic value = 'not a number';
    int result = value + 5; // Throws TypeError
    print('Result: $result'); // This line won't execute
  } on IntegerDivisionByZeroException {
    print('Cannot divide by zero');
  } on RangeError catch (e) {
    print('Index out of range: $e');
  } on TypeError catch (e) {
    print('Type error: $e');
  } catch (e) {
    // Catches any other exceptions not handled above
    print('Unknown error: $e');
  }
}

/// Demonstrates the finally block
/// 
/// The finally block always executes, whether an exception occurs or not
void finallyBlockExample() {
  // Simulating a resource that needs to be closed
  Resource resource = Resource();
  
  try {
    print('Resource opened');
    resource.performOperation(); // This will throw an exception
    print('Operation completed successfully'); // This won't execute
  } catch (e) {
    print('Error during operation: $e');
  } finally {
    // This code always runs, even if there's an exception
    resource.close();
    print('Resource closed');
  }
}

/// Simulates a resource that needs proper cleanup
class Resource {
  void performOperation() {
    throw Exception('Operation failed');
  }
  
  void close() {
    // Cleanup code here
  }
}

/// Demonstrates creating and using custom exceptions
/// 
/// Custom exceptions provide more specific error information
void customExceptionExample() {
  try {
    validateAge(-5);
  } on InvalidAgeException catch (e) {
    print('Invalid age: ${e.message}');
    print('Value provided: ${e.invalidValue}');
  }
  
  try {
    validateUsername('');
  } on ValidationException catch (e) {
    print('Validation error: ${e.message}');
  }
}

/// Custom exception for invalid age values
class InvalidAgeException implements Exception {
  final String message;
  final int invalidValue;
  
  InvalidAgeException(this.invalidValue, this.message);
  
  @override
  String toString() => 'InvalidAgeException: $message ($invalidValue)';
}

/// Base class for validation exceptions
class ValidationException implements Exception {
  final String message;
  
  ValidationException(this.message);
  
  @override
  String toString() => 'ValidationException: $message';
}

/// Validates that an age is positive
void validateAge(int age) {
  if (age < 0) {
    throw InvalidAgeException(age, 'Age cannot be negative');
  }
  print('Age $age is valid');
}

/// Validates that a username is not empty
void validateUsername(String username) {
  if (username.isEmpty) {
    throw ValidationException('Username cannot be empty');
  }
  print('Username "$username" is valid');
}

/// Demonstrates rethrowing exceptions
/// 
/// Sometimes you want to handle an exception partially and then rethrow it
void rethrowExample() {
  try {
    print('Attempting risky operation...');
    riskyOperation();
  } catch (e) {
    print('Logging error: $e');
    // Rethrow the exception after logging
    rethrow;
  }
}

/// A function that throws an exception
void riskyOperation() {
  throw Exception('Something went wrong in the risky operation');
}

/// Demonstrates working with stack traces
/// 
/// Stack traces help identify where an exception occurred
void stackTraceExample() {
  try {
    deeplyNestedFunction();
  } catch (e, stackTrace) {
    print('Exception: $e');
    print('\nStack trace:');
    // In a real application, you might want to log this instead of printing
    // Here we'll just print the first few lines
    print(stackTrace.toString().split('\n').take(3).join('\n'));
  }
}

/// A function that calls another function
void deeplyNestedFunction() {
  anotherFunction();
}

/// A function that calls another function
void anotherFunction() {
  functionThatThrows();
}

/// A function that throws an exception
void functionThatThrows() {
  throw Exception('Exception in deeply nested function');
}

/// Demonstrates error handling best practices
void bestPracticesExample() {
  // 1. Be specific about what exceptions you catch
  try {
    int value = int.parse('not a number');
    print(value);
  } on FormatException catch (e) {
    print('Specific exception handling: $e');
  }
  
  // 2. Provide meaningful error messages
  try {
    validateInput('', 'username');
  } catch (e) {
    print('Meaningful error: $e');
  }
  
  // 3. Don't catch exceptions you can't handle properly
  // Bad practice (commented out):
  // try {
  //   // Some code
  // } catch (e) {
  //   // Empty catch block or just print(e)
  // }
  
  // 4. Use nullable return types instead of exceptions for expected cases
  int? result = parseIntSafely('123');
  print('Safely parsed integer: $result');
  
  result = parseIntSafely('not a number');
  print('Safely parsed invalid string: $result');
}

/// Validates user input
void validateInput(String value, String fieldName) {
  if (value.isEmpty) {
    throw ArgumentError('The $fieldName field cannot be empty');
  }
}

/// Safely parses an integer, returning null instead of throwing an exception
int? parseIntSafely(String input) {
  try {
    return int.parse(input);
  } on FormatException {
    return null;
  }
}