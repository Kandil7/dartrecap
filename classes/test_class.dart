import 'dart:math';

class Test{
  String val1="one";
  String val2="two";
  // initializer list 
  int _secret;
  double _superSecret;
  Test(int age,double wallet):_secret=age,_superSecret=wallet;
  int randomValue(){
    print('Random!');
    return Random().nextInt(10);
  }
}