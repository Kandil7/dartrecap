class Person {
  final String name;
  static final Map<String, Person> _cache = {}; // تخزين الكائنات الموجودة

  // Factory Constructor
  factory Person(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final newPerson = Person._internal(name);
      _cache[name] = newPerson;
      return newPerson;
    }
  }

  // Private Constructor
  Person._internal(this.name);

  @override
  String toString() => 'Person{name: $name}';
}

