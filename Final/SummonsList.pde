public class SummonsList<Summons>{

  private Summons [] _stack;
  private int _stackSize;

  public SummonsList() 
  { 
    _stack = ( Summons[] )new Object[42];
    _stackSize = 0;
  }

  public void push( Summons s ) 
  { 
    if ( isFull() ) {
      Summons[] temp = ( Summons[] )new Object[ _stack.length * 2 + 1 ];  
      for ( int i = 0; i < _stack.length; i++ ) {
        temp[i] = _stack[i];
      }
      _stack = temp;
    }

    _stack[_stackSize] = s;
    _stackSize++;
  }

  public Summons peek( ) 
  { 
    Summons retVal = null;
    if ( isEmpty() )  return null;
    retVal = _stack[ _stackSize-1 ];
    return retVal;
  }
  
  public Summons pop( ) 
  { 
    Summons retVal = null;
    if ( isEmpty() )  return null;
    retVal = _stack[ _stackSize---1 ];
    return retVal;
  }

  public boolean isEmpty() { 
    return _stackSize == 0;
  }

  public boolean isFull() {
    return _stackSize >= _stack.length;
  }
}