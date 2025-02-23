import 'dart:math';

class Test{
  String val1="one";
  String val2="two";
  // initializer list 
  // ignore: unused_field
  int _secret;
  // ignore: unused_field
  double _superSecret;
  Test(int age,double wallet):_secret=age,_superSecret=wallet;
  int randomValue(){
    print('Random!');
    return Random().nextInt(10);
  }
}