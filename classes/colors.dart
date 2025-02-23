enum ColorType {
  red,
  green,
  blue;
}

class ColorObject {
  final String colorName;
  final int rgbValue;

  static final Map<ColorType, ColorObject> _cache = {};

  // Private Constructor
  ColorObject._internal(this.colorName, this.rgbValue);

  // Factory Constructor with Cache
  factory ColorObject(ColorType colorType) {
    if (_cache.containsKey(colorType)) {
      return _cache[colorType]!;
    } else {
      switch (colorType) {
        case ColorType.red:
          return _cache[colorType] = ColorObject._internal('Red', 0xFF0000);
        case ColorType.green:
          return _cache[colorType] = ColorObject._internal('Green', 0x00FF00);
        case ColorType.blue:
          return _cache[colorType] = ColorObject._internal('Blue', 0x0000FF);
      }
    }
  }

  @override
  String toString() => 'ColorObject{name: $colorName, RGB: #$rgbValue}';
}

