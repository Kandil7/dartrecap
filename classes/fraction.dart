class MyFraction{
  final int numerator;
  final int denominator;
  MyFraction(this.numerator,this.denominator);

  //named constructor
  // denominator cann't be 0 because 0/0 in not defined!
  MyFraction.zero():numerator=0,denominator=1;
}