
import 'classes/person.dart';
import 'classes/test_class.dart';

void main() {
var customer=Person("Mohamed", "Kandil");
print(customer.name);
print(customer.surname);

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

// 


}