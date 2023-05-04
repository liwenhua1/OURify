  class A {
    int x;



    virtual int thisNotNullOk() 
    static 
        presumes this::A<x:v> achieves ok this::A<x:v> & res = 0 ;
    static 
        presumes this=null achieves err this=null & a=null ;
    
    {
      if (this == null) {
        A a = null;
        int z = a.x;
        return z;
      } else {
      
      return 0;}
    }

    virtual int thisNotNullBad() 
    static 
        presumes this=null achieves ok this = null & res = 0 ;
    static 
        presumes this::A<x:v> achieves err this::A<x:v> & a=null ;
    
    {
      if (this != null) {
        A a = null;
        int z = a.x;
        return z;
      }
     else {
      
      return 0;}
    }

    
  }