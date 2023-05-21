class A {
  int i;
}

class Objec {
    
	virtual void toString()
	static	
	      presumes this::Objec<> achieves  this::Objec<>;
	dynamic	
	      presumes this::Objec<> achieves  this::Objec<>;
	{}

  virtual int length()
	static	
	      presumes this::Objec<> achieves  this::Objec<> & res = 5;
	{}

   Objec ()
	static
		presumes true achieves new_this::Objec<>;
	{}
} 

class NullPointerExceptionsMoreTests {

  virtual int testNullStringDereferencedBad() 
  static presumes this::NullPointerExceptionsMoreTests<> achieves err this::NullPointerExceptionsMoreTests<> & s= null;
  {
    Objec s = new Objec();
    int j = s.length();
    s = null;
    int temp = s.length();
    j = j + temp;
    return 42;
  }

  virtual int testBrachesAvoidNullPointerExceptionOK(int k) 
  static presumes this::NullPointerExceptionsMoreTests<> & k > 10 achieves ok this::NullPointerExceptionsMoreTests<> & s= null & res = 100 & k >10;
  static presumes this::NullPointerExceptionsMoreTests<> & k = 10 achieves ok this::NullPointerExceptionsMoreTests<> * s::Objec<> & res = 5 & k=10;
  static presumes this::NullPointerExceptionsMoreTests<> & k < 10 achieves ok this::NullPointerExceptionsMoreTests<> * s::Objec<> & res = 100 & k < 10;
  {
    Objec s = new Objec();
    int j = 100;
    if (k > 10) {
      s = null; 
    }
    if (k == 10) {
      int temp = s.length();
      j = temp;
    }
    return j;
  }

  virtual void testParameterOk(A arg) 
  static presumes this::NullPointerExceptionsMoreTests<> * arg::A<i:v> achieves ok this::NullPointerExceptionsMoreTests<> * arg::A<i:17>;
  static presumes this::NullPointerExceptionsMoreTests<> & arg = null achieves err this::NullPointerExceptionsMoreTests<> & arg = null;
  
  {
    arg.i = 17;
  }

  virtual int testArithmeticOk(int k) 
  static presumes this::NullPointerExceptionsMoreTests<> & k > 10 achieves ok this::NullPointerExceptionsMoreTests<> & s= null & res = 100 & k >10;
  static presumes this::NullPointerExceptionsMoreTests<> & k <= 10 achieves ok this::NullPointerExceptionsMoreTests<> * s::Objec<> & res = 5 & k=10;
  static presumes this::NullPointerExceptionsMoreTests<> & k <= 10 achieves ok this::NullPointerExceptionsMoreTests<> * s::Objec<> & res = 5 & k<10;

    {
  
    Objec s = new Objec();
    int j = 100;
    if (k > 10) {
      s = null; 
    }
    if (k == 10) {
      int temp = s.length();
      j = temp;
    }
    if (k < 10) {
      int temp = s.length();
      j = temp;
    }
    return j;
  }

   virtual int testArithmeticOneOK(int k) 
    static presumes this::NullPointerExceptionsMoreTests<> & k > 10 achieves ok this::NullPointerExceptionsMoreTests<> & s= null & res = 100 & k >10;
    static presumes this::NullPointerExceptionsMoreTests<> & k <= 10 achieves ok this::NullPointerExceptionsMoreTests<> * s::Objec<> & res = 5 & k=10;
    {Objec s = new Objec();
    int j = 100;
    if (k > 10) {
      s = null; 
    }
    int temp = k + k ;
    if (temp == 20) {
       int temp1 = s.length();
      j = temp1;
    }
    return j;
  }

  virtual int f_ident(int k) 
  static presumes this::NullPointerExceptionsMoreTests<> & k = v achieves ok this::NullPointerExceptionsMoreTests<> & k = v & res = v;

  {
    return k;
  }

  virtual int FP_testArithmeticTwo(int k)
       static presumes this::NullPointerExceptionsMoreTests<> & k > 10 achieves ok this::NullPointerExceptionsMoreTests<> & s= null & res = 100 & k >10;
       static presumes this::NullPointerExceptionsMoreTests<> & k <= 10 achieves ok this::NullPointerExceptionsMoreTests<> * s::Objec<> & res = 5 & k=10;

   {
   
    Objec s = new Objec();
    int j = 100;
    if (k > 10) {
      s = null; 
    }
     int temp = this.f_ident(k);
    if ( temp == 10) {

      int temp1 = s.length();
      j = temp1;
    }
    return j;
  }

}

class OtherClass {

  OtherClass x;

  OtherClass ()
	static
		presumes true achieves new_this::OtherClass<x:null>;
	{}


  virtual OtherClass canReturnNull() 
  static presumes this::OtherClass<x:null> achieves ok this::OtherClass<x:null> & res = null;

  {
    int z = this.x;
    return z;
  }

  virtual String buggyMethodBad() 
  static presumes this::OtherClass<x:null> achieves err this::OtherClass<x:null> * o::OtherClass<x:null>;
  {
    OtherClass o = new OtherClass();
    int temp = o.canReturnNull();
    temp.toString();
  }

  virtual void testingNullsafeLocalMode() 
  static presumes this::OtherClass<x:null> achieves err this::OtherClass<x:null> * o::OtherClass<x:null>;

  {
    OtherClass o = new OtherClass();
    int temp = o.canReturnNull();
    temp.getClass();
  }

 
}