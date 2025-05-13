// File: design_patterns_examples.dart
// Purpose: Demonstrates common design patterns implemented in Dart
// Author: Dart Learning Project

/// This file showcases implementations of common design patterns in Dart.
/// Design patterns are reusable solutions to common problems in software design.

/// Main function to run all design pattern examples
void main() {
  print('===== Design Patterns in Dart =====\n');
  
  print('1. Singleton Pattern:');
  singletonPatternExample();
  
  print('\n2. Factory Pattern:');
  factoryPatternExample();
  
  print('\n3. Builder Pattern:');
  builderPatternExample();
  
  print('\n4. Observer Pattern:');
  observerPatternExample();
  
  print('\n5. Strategy Pattern:');
  strategyPatternExample();
  
  print('\n===== Design Patterns Examples Complete =====');
}

// ===== Singleton Pattern =====

/// Singleton class implementation
class DatabaseConnection {
  // Private static instance
  static DatabaseConnection? _instance;
  
  // Private constructor
  DatabaseConnection._internal() {
    print('DatabaseConnection initialized');
  }
  
  // Factory constructor that returns the singleton instance
  factory DatabaseConnection() {
    _instance ??= DatabaseConnection._internal();
    return _instance!;
  }
  
  void query(String sql) {
    print('Executing query: $sql');
  }
}

/// Demonstrates the Singleton pattern
void singletonPatternExample() {
  print('Creating first database connection:');
  final db1 = DatabaseConnection();
  
  print('\nCreating second database connection:');
  final db2 = DatabaseConnection();
  
  print('\nAre both references the same object? ${identical(db1, db2)}');
  
  db1.query('SELECT * FROM users');
  db2.query('SELECT * FROM products');
}

// ===== Factory Pattern =====

/// Abstract shape class
abstract class Shape {
  void draw();
}

/// Concrete circle implementation
class Circle implements Shape {
  final double radius;
  
  Circle(this.radius);
  
  @override
  void draw() {
    print('Drawing a circle with radius $radius');
  }
}

/// Concrete rectangle implementation
class Rectangle implements Shape {
  final double width;
  final double height;
  
  Rectangle(this.width, this.height);
  
  @override
  void draw() {
    print('Drawing a rectangle with width $width and height $height');
  }
}

/// Shape factory class
class ShapeFactory {
  static Shape createShape(String type, List<double> dimensions) {
    switch (type.toLowerCase()) {
      case 'circle':
        return Circle(dimensions[0]);
      case 'rectangle':
        return Rectangle(dimensions[0], dimensions[1]);
      default:
        throw ArgumentError('Unknown shape type: $type');
    }
  }
}

/// Demonstrates the Factory pattern
void factoryPatternExample() {
  final circle = ShapeFactory.createShape('circle', [5.0]);
  final rectangle = ShapeFactory.createShape('rectangle', [4.0, 6.0]);
  
  circle.draw();
  rectangle.draw();
  
  try {
    final unknown = ShapeFactory.createShape('triangle', [1.0, 1.0, 1.0]);
    unknown.draw();
  } catch (e) {
    print('Error: $e');
  }
}

// ===== Builder Pattern =====

/// Product class
class Email {
  String? from;
  List<String> to = [];
  String? subject;
  String? body;
  List<String> cc = [];
  List<String> bcc = [];
  Map<String, String> headers = {};
  
  @override
  String toString() {
    return 'Email(from: $from, to: $to, subject: $subject, body: ${body?.substring(0, body!.length > 20 ? 20 : body!.length)}..., cc: $cc, bcc: $bcc, headers: $headers)';
  }
}

/// Builder interface
class EmailBuilder {
  final Email _email = Email();
  
  EmailBuilder from(String address) {
    _email.from = address;
    return this;
  }
  
  EmailBuilder to(String address) {
    _email.to.add(address);
    return this;
  }
  
  EmailBuilder subject(String subject) {
    _email.subject = subject;
    return this;
  }
  
  EmailBuilder body(String body) {
    _email.body = body;
    return this;
  }
  
  EmailBuilder cc(String address) {
    _email.cc.add(address);
    return this;
  }
  
  EmailBuilder bcc(String address) {
    _email.bcc.add(address);
    return this;
  }
  
  EmailBuilder addHeader(String name, String value) {
    _email.headers[name] = value;
    return this;
  }
  
  Email build() {
    // Validate the email
    if (_email.from == null || _email.from!.isEmpty) {
      throw ArgumentError('Email must have a sender');
    }
    if (_email.to.isEmpty) {
      throw ArgumentError('Email must have at least one recipient');
    }
    
    return _email;
  }
}

/// Demonstrates the Builder pattern
void builderPatternExample() {
  // Building a simple email
  final simpleEmail = EmailBuilder()
      .from('sender@example.com')
      .to('recipient@example.com')
      .subject('Hello')
      .body('This is a simple email.')
      .build();
  
  print('Simple email: $simpleEmail');
  
  // Building a more complex email
  final complexEmail = EmailBuilder()
      .from('sender@example.com')
      .to('recipient1@example.com')
      .to('recipient2@example.com')
      .subject('Meeting Invitation')
      .body('Please join us for a meeting tomorrow at 10 AM.')
      .cc('manager@example.com')
      .bcc('archive@example.com')
      .addHeader('X-Priority', 'High')
      .build();
  
  print('Complex email: $complexEmail');
  
  // Demonstrating validation
  try {
    final invalidEmail = EmailBuilder()
        .subject('Invalid Email')
        .body('This email has no sender or recipients')
        .build();
    print('Invalid email: $invalidEmail');
  } catch (e) {
    print('Validation error: $e');
  }
}

// ===== Observer Pattern =====

/// Subject interface
abstract class Subject {
  void registerObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}

/// Observer interface
abstract class Observer {
  void update(String message);
}

/// Concrete subject implementation
class NewsPublisher implements Subject {
  final List<Observer> _observers = [];
  String _latestNews = '';
  
  String get latestNews => _latestNews;
  
  void publishNews(String news) {
    _latestNews = news;
    notifyObservers();
  }
  
  @override
  void registerObserver(Observer observer) {
    _observers.add(observer);
  }
  
  @override
  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }
  
  @override
  void notifyObservers() {
    for (var observer in _observers) {
      observer.update(_latestNews);
    }
  }
}

/// Concrete observer implementation
class NewsSubscriber implements Observer {
  final String name;
  
  NewsSubscriber(this.name);
  
  @override
  void update(String message) {
    print('$name received news: $message');
  }
}

/// Demonstrates the Observer pattern
void observerPatternExample() {
  final publisher = NewsPublisher();
  
  final subscriber1 = NewsSubscriber('Subscriber 1');
  final subscriber2 = NewsSubscriber('Subscriber 2');
  final subscriber3 = NewsSubscriber('Subscriber 3');
  
  publisher.registerObserver(subscriber1);
  publisher.registerObserver(subscriber2);
  publisher.registerObserver(subscriber3);
  
  publisher.publishNews('Breaking news: Dart 3.0 released!');
  
  print('\nRemoving Subscriber 2...');
  publisher.removeObserver(subscriber2);
  
  publisher.publishNews('Update: Dart 3.0 includes major null safety improvements!');
}

// ===== Strategy Pattern =====

/// Strategy interface
abstract class PaymentStrategy {
  void pay(double amount);
}

/// Concrete strategy implementations
class CreditCardPayment implements PaymentStrategy {
  final String cardNumber;
  final String name;
  final String expiryDate;
  final String cvv;
  
  CreditCardPayment(this.cardNumber, this.name, this.expiryDate, this.cvv);
  
  @override
  void pay(double amount) {
    print('Paying $amount using Credit Card (${maskCardNumber(cardNumber)})');
  }
  
  String maskCardNumber(String number) {
    if (number.length <= 4) return number;
    return 'XXXX-XXXX-XXXX-${number.substring(number.length - 4)}';
  }
}

class PayPalPayment implements PaymentStrategy {
  final String email;
  final String password;
  
  PayPalPayment(this.email, this.password);
  
  @override
  void pay(double amount) {
    print('Paying $amount using PayPal account (${maskEmail(email)})');
  }
  
  String maskEmail(String email) {
    final atIndex = email.indexOf('@');
    if (atIndex <= 1) return email;
    return '${email.substring(0, 1)}...${email.substring(atIndex)}';
  }
}

class BankTransferPayment implements PaymentStrategy {
  final String accountNumber;
  final String bankCode;
  
  BankTransferPayment(this.accountNumber, this.bankCode);
  
  @override
  void pay(double amount) {
    print('Paying $amount using Bank Transfer to account ${maskAccountNumber(accountNumber)}');
  }
  
  String maskAccountNumber(String number) {
    if (number.length <= 4) return number;
    return 'XXXX...${number.substring(number.length - 4)}';
  }
}

/// Context class
class ShoppingCart {
  final List<String> items = [];
  PaymentStrategy? _paymentStrategy;
  
  void addItem(String item) {
    items.add(item);
  }
  
  void setPaymentStrategy(PaymentStrategy strategy) {
    _paymentStrategy = strategy;
  }
  
  void checkout(double totalAmount) {
    if (_paymentStrategy == null) {
      throw StateError('Payment strategy not set');
    }
    
    print('Checking out ${items.length} items:');
    for (var item in items) {
      print('- $item');
    }
    
    _paymentStrategy!.pay(totalAmount);
    print('Payment complete!');
  }
}

/// Demonstrates the Strategy pattern
void strategyPatternExample() {
  final cart = ShoppingCart();
  cart.addItem('Dart Book');
  cart.addItem('Flutter Course');
  cart.addItem('Developer Mug');
  
  print('Payment with Credit Card:');
  cart.setPaymentStrategy(
    CreditCardPayment('1234567890123456', 'John Doe', '12/25', '123')
  );
  cart.checkout(74.99);
  
  print('\nPayment with PayPal:');
  cart.setPaymentStrategy(
    PayPalPayment('john.doe@example.com', 'password123')
  );
  cart.checkout(74.99);
  
  print('\nPayment with Bank Transfer:');
  cart.setPaymentStrategy(
    BankTransferPayment('987654321', 'BANKCODE123')
  );
  cart.checkout(74.99);
}