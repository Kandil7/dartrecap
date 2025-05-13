// File: dart_best_practices.dart
// Purpose: Demonstrates Dart best practices and clean code principles
// Author: Dart Learning Project

/// This file showcases best practices for writing clean, maintainable Dart code,
/// including naming conventions, documentation, and code organization.

// Import statements should be organized in groups with core libraries first
import 'dart:async';
import 'dart:math';

// Third-party imports would come next (if any)
// import 'package:some_package/some_package.dart';

// Local imports come last
// import '../other_local_file.dart';

/// Main function to demonstrate best practices
void main() {
  print('===== Dart Best Practices =====\n');
  
  print('1. Naming Conventions:');
  namingConventionsExample();
  
  print('\n2. Documentation:');
  documentationExample();
  
  print('\n3. Code Organization:');
  codeOrganizationExample();
  
  print('\n4. Effective Dart Principles:');
  effectiveDartExample();
  
  print('\n===== Best Practices Examples Complete =====');
}

/// Demonstrates proper naming conventions in Dart
void namingConventionsExample() {
  // Class names are UpperCamelCase
  final user = User('John', 'Doe');
  print('User: ${user.fullName}');
  
  // Variables, functions, and parameters are lowerCamelCase
  final userAge = 30;
  final isActive = true;
  
  // Constants are lowerCamelCase
  const maxLoginAttempts = 3;
  
  // Private identifiers start with underscore
  final calculator = _Calculator();
  print('5 + 3 = ${calculator.add(5, 3)}');
  
  // Enum values are lowerCamelCase
  final status = UserStatus.active;
  print('User status: $status');
  
  // Library names are lowercase_with_underscores
  // e.g., 'dart_best_practices.dart'
  
  print('Naming conventions demonstrated with:');
  print('- Class name: User (UpperCamelCase)');
  print('- Variables: userAge, isActive (lowerCamelCase)');
  print('- Constant: maxLoginAttempts (lowerCamelCase)');
  print('- Private class: _Calculator (starts with _)');
  print('- Enum value: UserStatus.active (lowerCamelCase)');
  print('- Library name: dart_best_practices.dart (lowercase_with_underscores)');
}

/// Demonstrates proper documentation practices in Dart
/// 
/// This function shows how to write effective documentation comments
/// for classes, methods, and properties.
void documentationExample() {
  // Create an instance of a well-documented class
  final product = Product(
    id: 'prod-123',
    name: 'Smartphone',
    price: 699.99,
    category: ProductCategory.electronics,
  );
  
  print('Product: ${product.name}');
  print('Formatted price: ${product.formattedPrice}');
  print('Is on sale: ${product.isOnSale}');
  
  // Show documentation best practices
  print('\nDocumentation best practices:');
  print('- Use /// for documentation comments');
  print('- Document all public APIs');
  print('- Include examples in documentation');
  print('- Describe parameters and return values');
  print('- Use markdown formatting in comments');
}

/// Demonstrates code organization best practices
void codeOrganizationExample() {
  // Create a service that follows the repository pattern
  final userRepository = UserRepository();
  final userService = UserService(userRepository);
  
  // Use the service to perform operations
  final user = userService.getUserById('user-123');
  print('Retrieved user: ${user?.fullName ?? "Not found"}');
  
  // Show code organization best practices
  print('\nCode organization best practices:');
  print('- Separate concerns (e.g., UI, business logic, data access)');
  print('- Use design patterns appropriately');
  print('- Keep classes focused on a single responsibility');
  print('- Limit file size and class complexity');
  print('- Group related functionality');
}

/// Demonstrates principles from Effective Dart
void effectiveDartExample() {
  // Style examples
  final list = [1, 2, 3];
  final map = {'a': 1, 'b': 2};
  
  // Prefer using collection literals
  print('Collection literals: $list, $map');
  
  // Prefer using string interpolation
  final name = 'Dart';
  final greeting = 'Hello, $name!';
  print(greeting);
  
  // Prefer using arrow syntax for simple functions
  final doubled = list.map((n) => n * 2).toList();
  print('Doubled: $doubled');
  
  // Prefer final for variables that don't change
  final timestamp = DateTime.now();
  print('Timestamp: $timestamp');
  
  // Show Effective Dart principles
  print('\nEffective Dart principles:');
  print('- Style: Consistent formatting and naming');
  print('- Documentation: Clear, complete, and markdown-formatted');
  print('- Usage: API design and feature usage');
  print('- Design: Creating robust and maintainable libraries');
}

// CLASSES DEMONSTRATING BEST PRACTICES

/// Represents a user in the system
/// 
/// Each user has a first and last name, which are combined to create
/// a full name for display purposes.
/// 
/// Example:
/// ```dart
/// final user = User('John', 'Doe');
/// print(user.fullName); // Outputs: John Doe
/// ```
class User {
  /// The user's first name
  final String firstName;
  
  /// The user's last name
  final String lastName;
  
  /// Creates a new user with the given first and last name
  User(this.firstName, this.lastName);
  
  /// Returns the user's full name (first name + last name)
  String get fullName => '$firstName $lastName';
}

/// A private calculator class demonstrating private members
class _Calculator {
  /// Adds two numbers and returns the result
  int add(int a, int b) => a + b;
  
  /// Subtracts b from a and returns the result
  int subtract(int a, int b) => a - b;
}

/// Status of a user account
enum UserStatus {
  /// User is active and can use the system
  active,
  
  /// User is inactive but can be reactivated
  inactive,
  
  /// User has been suspended due to policy violations
  suspended,
  
  /// User account has been permanently deleted
  deleted,
}

/// Categories for products
enum ProductCategory {
  /// Electronic devices and accessories
  electronics,
  
  /// Clothing and fashion items
  clothing,
  
  /// Food and beverage items
  food,
  
  /// Books, e-books, and publications
  books,
}

/// Represents a product in an e-commerce system
/// 
/// Products have various properties like ID, name, price, and category.
/// They can also be put on sale with a discount.
/// 
/// Example:
/// ```dart
/// final product = Product(
///   id: 'prod-123',
///   name: 'Smartphone',
///   price: 699.99,
///   category: ProductCategory.electronics,
/// );
/// 
/// print(product.formattedPrice); // Outputs: $699.99
/// ```
class Product {
  /// Unique identifier for the product
  final String id;
  
  /// Display name of the product
  final String name;
  
  /// Price in USD
  final double price;
  
  /// Category the product belongs to
  final ProductCategory category;
  
  /// Whether the product is currently on sale
  bool isOnSale = false;
  
  /// Discount percentage when the product is on sale
  double discountPercentage = 0;
  
  /// Creates a new product with the required properties
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });
  
  /// Returns the price formatted as a currency string
  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  
  /// Puts the product on sale with the specified discount percentage
  /// 
  /// The [percentage] must be between 0 and 100.
  /// 
  /// Example:
  /// ```dart
  /// product.putOnSale(25); // 25% discount
  /// ```
  /// 
  /// Throws an [ArgumentError] if the percentage is invalid.
  void putOnSale(double percentage) {
    if (percentage < 0 || percentage > 100) {
      throw ArgumentError('Discount percentage must be between 0 and 100');
    }
    
    isOnSale = true;
    discountPercentage = percentage;
  }
  
  /// Removes the product from sale
  void removeFromSale() {
    isOnSale = false;
    discountPercentage = 0;
  }
  
  /// Returns the discounted price if the product is on sale
  double get currentPrice {
    if (isOnSale) {
      final discount = price * (discountPercentage / 100);
      return price - discount;
    }
    return price;
  }
}

/// Repository for accessing user data
/// 
/// This class demonstrates the repository pattern, which separates
/// data access logic from business logic.
class UserRepository {
  // In a real application, this would interact with a database or API
  final Map<String, User> _users = {
    'user-123': User('John', 'Doe'),
    'user-456': User('Jane', 'Smith'),
  };
  
  /// Retrieves a user by their ID
  /// 
  /// Returns null if no user is found with the given ID.
  User? getUserById(String id) {
    return _users[id];
  }
  
  /// Saves a user to the repository
  void saveUser(String id, User user) {
    _users[id] = user;
  }
}

/// Service for user-related operations
/// 
/// This class demonstrates the service pattern, which encapsulates
/// business logic and uses repositories for data access.
class UserService {
  final UserRepository _repository;
  
  /// Creates a new user service with the given repository
  UserService(this._repository);
  
  /// Retrieves a user by their ID
  User? getUserById(String id) {
    return _repository.getUserById(id);
  }
  
  /// Creates a new user with the given first and last name
  /// 
  /// Returns the ID of the newly created user.
  String createUser(String firstName, String lastName) {
    final user = User(firstName, lastName);
    final id = 'user-${DateTime.now().millisecondsSinceEpoch}';
    _repository.saveUser(id, user);
    return id;
  }
}