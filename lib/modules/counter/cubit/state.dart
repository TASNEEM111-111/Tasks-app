abstract class counterStates
{

}
class counterIntialState extends counterStates{

}
class counterMinusState extends counterStates
{
       final int counter;
       counterMinusState(this.counter);
}

class counterPlusState extends counterStates
{
         final int counter;
         counterPlusState(this.counter);
}