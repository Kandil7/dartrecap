
import 'dart:math';
void callMain(){
  print('Hello, World!');

  print(checkNumber(8));

  print(checker(5));

  print(nanosl);

  print(anon(" Kandil"));

  test((value){print("Number is $value");});

  testInner(22);

  printData(loge);

}
// simple function
String checkEvenNumber(num number){
 if(number==1)
 {return "Even Number";}
 if (number==0)
 {return "Odd Number";}
 else return "number";
 
}
//arrow syntax with method calls  
String checkNumber(num num)=>checkEvenNumber(num%2);
// assign function to variable
String Function(num) checker=checkNumber;

// anonymous functions

// single line 
final nanosl=()=>5.8+7.2;

// muiltiple line 
final anon=(String nickname){
  var name="Mohamed";
  name +=nickname;
  return name;
};

//function callback
final numlist=[1,2,3,4,5,6,7];
void test(void Function(int) action){
  for (final item in numlist)
    action(item);
}
//nested function 

testInner(int value){
  //nested function
  int randomVaue()=>Random().nextInt(value);
 //using the nested function
  final number=value+randomVaue();
  print(number);
}
 void loge(String data)=>print(data);
//using typedef

typedef logger=void Function(String msg);

void printData(logger loge){
  loge("Done.");
}