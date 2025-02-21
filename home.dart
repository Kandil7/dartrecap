void main() {
  print('Hello, World!');

  print(checkNumber(8));

  print(checker(5));

}
String checkEvenNumber(num number){
 if(number==1)
 {return "Even Number";}
 if (number==0)
 {return "Odd Number";}
 else return "number";
 
}

String checkNumber(num num)=>checkEvenNumber(num%2);

String Function(num) checker=checkNumber;