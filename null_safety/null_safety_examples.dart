// File: null_safety_examples.dart
// Purpose: Demonstrates null safety features in Dart
// Author: Dart Learning Project

/// This file showcases Dart's null safety features and best practices for handling nullable types.
/// Null safety helps prevent null reference exceptions at runtime by catching them at compile time.

/// Main function to run all null safety examples
void main() {
  print('===== Null Safety in Dart =====\n');
  
  print('1. Nullable and Non-nullable Types:');
  nullableTypesExample();
  
  print('\n2. The Late Keyword:');
  lateKeywordExample();
  
  print('\n3. Null-aware Operators:');
  nullAwareOperatorsExample();
  
  print('\n4. Flow Analysis:');
  flowAnalysisExample();
  
  print('\n5. Required Named Parameters:');
  requiredParametersExample();
  
  print('\n6. Null Safety Best Practices:');
  nullSafetyBestPracticesExample();
  
  print('\n===== Null Safety Examples Complete =====');
}

/// Demonstrates nullable and non-nullable types
void nullableTypesExample() {
  // Non-nullable types (must be initialized with a non-null value)
  String nonNullableString = 'This cannot be null';
  int nonNullableInt = 42;
  
  // Nullable types (can hold null)
  String? nullableString = 'This can be null';
  int? nullableInt = null;
  
  print('Non-nullable string: $nonNullableString');
  print('Non-nullable int: $nonNullableInt');
  print('Nullable string: $nullableString');
  print('Nullable int: $nullableInt');
  
  // Attempting to assign null to non-nullable types would cause a compile-time error
  // nonNullableString = null; // Error: The value 'null' can't be assigned to a variable of type 'String'
  
  // Reassigning nullable types
  nullableString = null;
  print('Nullable string after reassignment: $nullableString');
}

/// Demonstrates the late keyword
void lateKeywordExample() {
  final person = Person();
  
  // Late initialization
  print('Name will be initialized when accessed: ${person.name}');
  
  // Late final variables
  person.setAddress('123 Dart Street');
  print('Address: ${person.address}');
  
  // Late with initializer
  print('Bio is lazily initialized: ${person.bio}');
}

/// Class to demonstrate late variables
class Person {
  // Late variable without initializer
  // Will be initialized before first use
  late String name = _fetchName();
  
  // Late final variable
  late final String address;
  
  // Late variable with initializer
  // The initializer runs only when the variable is first used
  late String bio = _fetchBio();
  
  String _fetchName() {
    print('Fetching name...');
    return 'John Doe';
  }
  
  String _fetchBio() {
    print('Fetching bio...');
    return 'A Dart developer';
  }
  
  void setAddress(String value) {
    address = value;
  }
}

/// Demonstrates null-aware operators
void nullAwareOperatorsExample() {
  // Nullable variables
  String? nullableStr1 = 'Not null';
  String? nullableStr2 = null;
  
  // Null-aware access operator (?.)
  print('Length of nullableStr1: ${nullableStr1?.length}');
  print('Length of nullableStr2: ${nullableStr2?.length}');
  
  // Null-aware assignment operator (??=)
  nullableStr2 ??= 'Default value';
  print('nullableStr2 after ??= operator: $nullableStr2');
  
  // Null-coalescing operator (??)
  String result1 = nullableStr1 ?? 'Default';
  String result2 = nullableStr2 ?? 'Default';
  print('result1: $result1');
  print('result2: $result2');
  
  // Null assertion operator (!)
  String nonNullStr = nullableStr1!; // Safe because we know it's not null
  print('Non-null string: $nonNullStr');
  
  // Cascade operator with null check (?..)  
  User? user = User('Alice');
  user?..setAge(30)
      ..setEmail('alice@example.com');
  print('User: ${user?.toString()}');
  
  User? nullUser = null;
  nullUser?..setAge(25)
         ..setEmail('null@example.com'); // No operations performed if nullUser is null
  print('Null user: $nullUser');
}

/// Class for null-aware operator examples
class User {
  String name;
  int? age;
  String? email;
  
  User(this.name);
  
  void setAge(int value) {
    age = value;
  }
  
  void setEmail(String value) {
    email = value;
  }
  
  @override
  String toString() {
    return 'User(name: $name, age: $age, email: $email)';
  }
}

/// Demonstrates flow analysis for null safety
void flowAnalysisExample() {
  String? nullableValue = getStringOrNull(true);
  
  // Flow analysis understands that this check ensures nullableValue is not null
  if (nullableValue != null) {
    // Within this block, nullableValue is treated as non-nullable
    print('Length of string: ${nullableValue.length}');
  }
  
  // Using flow analysis with conditional expressions
  String? anotherNullable = getStringOrNull(false);
  
  // Early return pattern
  if (anotherNullable == null) {
    print('anotherNullable is null, returning early');
    return;
  }
  
  // At this point, flow analysis knows anotherNullable is not null
  print('anotherNullable uppercase: ${anotherNullable.toUpperCase()}');
}

/// Helper function that may return null
String? getStringOrNull(bool returnValue) {
  return returnValue ? 'A string value' : null;
}

/// Demonstrates required named parameters
void requiredParametersExample() {
  // Creating a product with required parameters
  final product = Product(
    id: 1,
    name: 'Dart T-shirt',
    price: 25.99,
  );
  
  print('Product: ${product.toString()}');
  
  // Optional parameters can be omitted
  final simpleProduct = Product(
    id: 2,
    name: 'Dart Mug',
    price: 12.99,
  );
  
  print('Simple product: ${simpleProduct.toString()}');
}

/// Class with required and optional parameters
class Product {
  final int id;
  final String name;
  final double price;
  final String? description;
  final String? category;
  
  // Required parameters use the 'required' keyword
  // Optional parameters can be nullable or have default values
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.category,
  });
  
  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: \$${price.toStringAsFixed(2)}, ' +
           'description: $description, category: $category)';
  }
}

/// Demonstrates null safety best practices
void nullSafetyBestPracticesExample() {
  print('1. Prefer non-nullable types when possible');
  print('2. Use the late keyword judiciously');
  print('3. Avoid the null assertion operator (!) unless you are absolutely sure');
  print('4. Use conditional property access (?.) for potentially null values');
  print('5. Initialize variables at declaration when possible');
  print('6. Use required for mandatory named parameters');
  print('7. Leverage flow analysis to avoid unnecessary null checks');
  
  // Example of avoiding null assertion
  String? maybeString = getStringOrNull(false);
  
  // Bad practice: Using null assertion when not sure
  // print('Unsafe length: ${maybeString!.length}'); // Could crash at runtime
  
  // Good practice: Using conditional property access
  print('Safe access: ${maybeString?.length ?? 'N/A'}');
  
  // Good practice: Using if-null operator
  String safeString = maybeString ?? 'Default string';
  print('Safe string: $safeString');
}