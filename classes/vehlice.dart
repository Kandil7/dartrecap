class Vehicle {
  final String type;
  Vehicle(this.type);
  // Factory Constructor
  factory Vehicle.cache(String vehicleType) {
    if (vehicleType == 'car') {
      return Car();
    } else if (vehicleType == 'bike') {
      return Bike();
    } else {
      throw ArgumentError('Invalid vehicle type');
    }
  }

  @override
  String toString() => 'Vehicle{type: $type}';
}

class Car extends Vehicle {
  Car() : super('Car');
}

class Bike extends Vehicle {
  Bike() : super('Bike');
}

