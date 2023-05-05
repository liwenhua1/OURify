  class A {
    int x;

  A()
  static presumes true achieves new_this::A<x:null> ;
  {

  }

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

    virtual void method() 
        static 
            presumes this::A<x:q> achieves ok this::A<x:q> ;
    {}
    
    virtual int nullPointerException() 
    static 
            presumes this::A<x:v> achieves err this::A<x:v> & a = null ;
    {
    A a = null;
    int z = a.x;
        return z;
  }

    virtual A canReturnNullObject(boolean o) 
    static 
            presumes this::A<x:v> & o=1 achieves ok this::A<x:v> * a::A<x:null> & res=a & o=1;
    static 
            presumes this::A<x:v> & o=0 achieves ok this::A<x:v> * a::A<x:null> & res=null & o=0;
    {
    A a = new A();
    if (o) {return a;}
    else {return null;}
  }

    virtual void expectNotNullObjectParameter(A a) 
    static 
            presumes this::A<x:v> & a=null achieves err this::A<x:v> & a=null;
    static 
            presumes this::A<x:v> * a::A<x:w> achieves ok this::A<x:v> * a::A<x:w>;
    {
    a.method();
  }

  virtual int nullPointerExceptionInterProc() 
  static 
        presumes this::A<x:v> achieves err this::A<x:v> * a::A<x:null> & b=null & o=1;
  {
    int i = 0;
    A b = this.canReturnNullObject(i);
    int temp = b.x;
    return temp;
  }
  
  }

  class B {
    A a;

    B()
  static
    presumes true achieves new_this::B<a:null> ;
  {

  }

    virtual void test() {}
  }

  class C {
    B b;


  C()
  static
    presumes true achieves new_this::C<b:null> ;
  {

  }
  

  virtual int FN_nullPointerExceptionWithAChainOfFields(C c) 
    static presumes this::C<b:v1> * c::C<b:w1> achieves err this::C<b:v1> * c::C<b:temp> * temp::B<a:null> ;
  {
    B temp = new B();
    c.b = temp;
    int temp2 = c.b;
    int temp3 = temp2.a;
    int temp4 = temp3.x;
    return temp4;
  }
  }