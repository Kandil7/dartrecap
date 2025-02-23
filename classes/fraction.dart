class MyFraction{
  final int numerator;
  final int denominator;
  MyFraction(this.numerator,this.denominator);

  //named constructor
  // denominator cann't be 0 because 0/0 in not defined!
  MyFraction.zero():numerator=0,denominator=1;

  //redirecting consturctor
  // represents '1/2'
  MyFraction.oneHalf():this(1,2);
  // represents integers , like '3' which is '3/1'
  MyFraction.whole(int val):this (val,1);
  
}