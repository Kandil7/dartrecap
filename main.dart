
import 'classes/colors.dart';
import 'classes/fraction.dart';
import 'classes/person.dart';
import 'classes/test_class.dart';
import 'classes/vehlice.dart';

void main() {


Test test=Test(22,3.8);



print(test.val1);
print(test.val2);

// pass a value to variable with a classic way
test.val1="one_1";
test.val2="two_2";
print(test.val1);
print(test.val2);
// pass a value to variable in 'cascade '
test..val1='one_1_cascade'
..val2='two_2_cascade';

print(test.val1);
print(test.val2);

// implement class method in cascade way

test..randomValue()
..randomValue()
..randomValue();
print(test.randomValue());

// named contructor 
 var value1=MyFraction(0, 1);
 print(value1.denominator);
 var value2=MyFraction.zero();
 print(value2.denominator);

 // redirecting constuctors

 var value3=MyFraction.oneHalf();
 print(value3.denominator);
 print(value3.numerator);
 var value4=MyFraction.whole(4);
 print(value4.denominator);
 print(value4.numerator);

 // equality operator on factory constructor
 var person1 = Person('Ahmed');
  var person2 = Person('Ahmed');

  print(person1 == person2); 

    var car = Vehicle.cache('car');
  var bike = Vehicle.cache('bike');

  print(car); // Vehicle{type: Car}
  print(bike); // Vehicle{type: Bike}

  var red1 = ColorObject(ColorType.red);
  var red2 = ColorObject(ColorType.red);

  print(red1 == red2); // true (لأن الكائن تم إعادة استخدامه)

  print(red1); // ColorObject{name: Red, RGB: #FFFF0000}
  print(red2); // ColorObject{name: Red, RGB: #FFFF0000}


}