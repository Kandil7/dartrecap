void main() {
  print('Hello, World!');

  print(checkNumber(8));

  print(checker(5));

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