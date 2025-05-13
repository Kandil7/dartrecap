// File: async_examples.dart
// Purpose: Demonstrates asynchronous programming concepts in Dart
// Author: Dart Learning Project

/// This file contains examples of asynchronous programming in Dart,
/// including Futures, async/await, and Streams.

// Import for delayed operations and stream functionality
import 'dart:async';

/// Main function to run all async examples
void main() async {
  print('===== Asynchronous Programming in Dart =====\n');
  
  // Basic Future example
  print('1. Basic Future Example:');
  basicFutureExample();
  
  // We need to wait for async operations to complete
  print('\n2. Async/Await Example:');
  await asyncAwaitExample();
  
  print('\n3. Error Handling in Async Code:');
  await errorHandlingExample();
  
  print('\n4. Stream Example:');
  await streamExample();
  
  print('\n5. Stream Transformations:');
  await streamTransformationExample();
  
  print('\n===== Async Examples Complete =====');
}

/// Demonstrates basic Future usage with callbacks
/// 
/// Futures represent values that will be available at some point in the future.
/// They are the foundation of asynchronous programming in Dart.
void basicFutureExample() {
  print('Creating a Future...');
  
  // Create a Future that completes after 2 seconds
  Future<String> futureValue = Future.delayed(
    Duration(seconds: 2),
    () => 'Future value is ready!',
  );
  
  // Using then() to handle the Future's value when it completes
  futureValue.then((value) {
    print('Received: $value');
  }).catchError((error) {
    print('Error: $error');
  }).whenComplete(() {
    print('Future operation complete');
  });
  
  print('Future is running in the background...');
}

/// Demonstrates async/await syntax for cleaner asynchronous code
/// 
/// The async keyword marks a function that returns a Future.
/// The await keyword pauses execution until the Future completes.
Future<void> asyncAwaitExample() async {
  print('Starting async operation...');
  
  try {
    // Await pauses execution until the Future completes
    String result = await fetchUserData();
    print('User data: $result');
    
    // Multiple sequential async operations
    String processedData = await processData(result);
    print('Processed data: $processedData');
  } catch (e) {
    print('Error in async operation: $e');
  }
  
  print('Async operation complete');
}

/// Simulates fetching user data from a remote source
/// 
/// Returns a Future that completes after a delay
Future<String> fetchUserData() {
  return Future.delayed(
    Duration(seconds: 2),
    () => '{"name": "John Doe", "email": "john@example.com"}',
  );
}

/// Simulates processing data
/// 
/// Takes a JSON string and returns a processed result
Future<String> processData(String data) {
  return Future.delayed(
    Duration(seconds: 1),
    () => 'Processed: $data',
  );
}

/// Demonstrates error handling in asynchronous code
/// 
/// Shows how to handle errors with try/catch and Future API
Future<void> errorHandlingExample() async {
  // Using try/catch with async/await
  print('Using try/catch with async/await:');
  try {
    await Future.delayed(Duration(seconds: 1), () {
      throw Exception('Simulated error in async operation');
    });
  } catch (e) {
    print('Caught error: $e');
  }
  
  // Using Future API for error handling
  print('\nUsing Future API for error handling:');
  Future.delayed(Duration(seconds: 1), () {
    throw Exception('Another simulated error');
  }).then((_) {
    print('This won\'t execute');
  }).catchError((error) {
    print('Caught with catchError: $error');
  });
  
  // Wait to see the result of the second example
  await Future.delayed(Duration(seconds: 2));
}

/// Demonstrates Stream usage for handling sequences of asynchronous events
/// 
/// Streams are like asynchronous Iterables - they provide a sequence of
/// values over time rather than all at once.
Future<void> streamExample() async {
  print('Creating a Stream...');
  
  // Create a Stream that emits a value every second
  Stream<int> numberStream = createNumberStream();
  
  // Listen to the Stream events
  StreamSubscription<int> subscription = numberStream.listen(
    (data) => print('Received from stream: $data'),
    onError: (error) => print('Stream error: $error'),
    onDone: () => print('Stream completed'),
  );
  
  // Cancel the subscription after 5.5 seconds
  await Future.delayed(Duration(milliseconds: 5500));
  await subscription.cancel();
  print('Stream subscription cancelled');
}

/// Creates a Stream that emits integers every second
/// 
/// Uses a StreamController to create and manage the Stream
Stream<int> createNumberStream() {
  StreamController<int> controller = StreamController<int>();
  
  int count = 1;
  // Add a new value to the stream every second
  Timer.periodic(Duration(seconds: 1), (timer) {
    if (count <= 5) {
      controller.add(count++);
    } else {
      timer.cancel();
      controller.close();
    }
  });
  
  return controller.stream;
}

/// Demonstrates Stream transformations
/// 
/// Shows how to transform, filter, and combine Stream data
Future<void> streamTransformationExample() async {
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);
  
  // Transform: multiply each value by 10
  Stream<int> multipliedStream = numberStream.map((number) => number * 10);
  
  print('Transformed stream (map):');
  await multipliedStream.forEach((value) => print('$value'));
  
  // Create a new stream for further examples
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  
  // Filter: only even numbers
  Stream<int> evenNumbersStream = numbers.where((number) => number % 2 == 0);
  
  print('\nFiltered stream (where):');
  await evenNumbersStream.forEach((value) => print('$value'));
}