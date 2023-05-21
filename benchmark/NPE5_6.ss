class Objec {
    
	virtual void toString()
	static	
	      presumes this::Objec<> achieves  this::Objec<>;
	dynamic	
	      presumes this::Objec<> achieves  this::Objec<>;
	{}
   Objec ()
	static
		presumes true achieves  new_this::Objec<>;
	{}
} 


class I {
    virtual Objec defaultMethod1() 
    static presumes this::I<> achieves ok this::I<> & res = null;
    dynamic presumes this::I<> achieves ok this::I<> & res = null;
    {
      return null;
    }

    virtual Object defaultMethod2() 
    static presumes this::I<> achieves ok this::I<> * res::Objec<>;
    dynamic presumes this::I<> achieves ok this::I<> * res::Objec<>;
    {
      
      return new Objec();
    }
  }

 class A extends I {

    A ()
	  static
		presumes true achieves  new_this::A<>;
	{}

    inherit Objec defaultMethod1() 
    static presumes this::A<> achieves ok this::A<> & res = null;
    dynamic presumes this::I<>A<>  achieves ok this::I<>A<> & res = null;
    {
    }

    inherit Objec defaultMethod2() 
    static presumes this::A<> achieves ok this::A<> * res::Objec<>;
    dynamic presumes this::I<>A<> achieves ok this::I<>A<> * res::Objec<>;
    {
      
    }

    virtual void defaultCallNPE() 
    static presumes this::A<> achieves err this::A<> & temp = null;
    {
      Objec temp = this.defaultMethod1();
      temp.toString();
    }

    virtual void defaultCallOk() 
    static presumes this::A<> achieves ok this::A<> * temp :: Objec<>;
    {
      Objec temp = this.defaultMethod2();
      temp.toString();
    }
  }

 class B extends A {

   B ()
	  static
		presumes true achieves  new_this::B<>;
	{}
    override Objec defaultMethod1() 
    static presumes this::B<> achieves ok this::B<> * res :: Objec<>;
    dynamic presumes this::I<>A<>  achieves ok this::I<>A<> & res = null;
    dynamic presumes this::B<>  achieves ok this::B<> * res :: Objec<>;
    {
      return new Objec();
    }

    override Objec defaultMethod2() 
    static presumes this::B<> achieves ok this::B<> & res = null;
    dynamic presumes this::I<>A<>  achieves ok this::I<>A<> * res :: Objec<>;
    dynamic presumes this::B<>  achieves ok this::B<> & res = null;
    {
      return null;
    }

    virtual void overridenCallOk() 
    static presumes this::B<> achieves ok this::B<> * temp::Objec<>;
    {
      Objec temp = this.defaultMethod1();
      temp.toString();
    }

    virtual void overridenCallNPE() 
    static presumes this::B<> achieves err this::B<> & temp = null;
    {
      Objec temp = this.defaultMethod2();
      temp.toString();
    }
  

  virtual void uncertainCallMethod1NPE_latent(int i) 
  static presumes this::B<> & i > 0 achieves ok this::B<> * aorb::B<> * temp::Objec<> & i > 0 ;
  static presumes this::B<> & i <= 0 achieves err this::B<> * aorb::A<> & temp=null & i <= 0 ;
  {
    A aorb = new A();
    if (i > 0) { 
      aorb = new B();
    }
    Objec temp = aorb.defaultMethod1();
    temp.toString();
  }

  virtual void uncertainCallMethod2NPE(int i) 
  static presumes this::B<> & i > 0 achieves err this::B<> * aorb::B<> & temp=null & i > 0 ;
  static presumes this::B<> & i <= 0 achieves ok this::B<> * aorb::A<> * temp::Objec<> & i <= 0 ;
  {
    A aorb = new A();
    if (i > 0) { 
      aorb = new B();
    }
    Objec temp = aorb.defaultMethod2();
    temp.toString();
  }
 }

class IntExample {

  int x;

  virtual int testAssignNonNullOk() 
  static presumes this::IntExample<x:v>  achieves ok this::IntExample<x:1> & res = 2 ;
  {
    this.x = 1;
    int temp = this.x;
    temp = temp + 1;
    return temp;
  }

  virtual Double FN_testdReadNullableBad() 
  static presumes this::IntExample<x:null>  achieves err this::IntExample<x:null>  ;
  {
    int temp = this.x;
    int temp2 = temp + 1;
    return temp2;
  }
}