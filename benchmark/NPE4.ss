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
  
  class A extends Objec{
    int x;

  A()
  static presumes true achieves new_this::A<x:null> ;
  {

  }


  virtual int match(int d)
  static presumes this::A<x:q2> & d = q2 achieves ok this::A<x:q2> & d = q2 & res = d;
  static presumes this::A<x:q2> & d != q2 achieves ok this::A<x:q2> & d != q2 & res = null;
  {
    int temp = this.x;
    if (temp == d) {return d;} else {return null;}
  }



    virtual void nullPointerExceptionFromNotKnowingThatThisIsNotNull() 
    static presumes this=null achieves err this=null ;
    static presumes this::A<x:v> achieves ok this::A<x:4> ;
    {
    if (this == null) {} else {}
    this.x = 4;
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

    inherit void toString()
	static	
	      presumes this::A<x:v> achieves  this::A<x:v>;
	dynamic	
	      presumes this::Objec<>A<x:v> achieves  this::Objec<>A<x:v>;
	{}

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

    virtual A get()
    static presumes this::B<a:r> * r::A<x:y> achieves ok this::B<a:r> * r::A<x:y> & res = r;
    {
      int temp = this.a;
      return temp;
    }
  }

  class C {
    B b;


  C()
  static
    presumes true achieves new_this::C<b:null> ;
  {

  }

   virtual void method(A a) 
        static 
            presumes this::C<b:q1> * a::A<x:w1> achieves ok this::C<b:q1> * a::A<x:w1> ;
            presumes this::C<b:q1> & a=null achieves err this::C<b:q1> & a=null ;
    {a.method();}
  

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

    virtual void nullPointerExceptionWithNullObjectParameter() 
    static 
            presumes this::C<b:q1>  achieves err this::C<b:q1> & temp = null ;
    {
      A temp = null;
    this.method(temp);
  }

    virtual Objec id_generics(Objec o) 
    static presumes this::C<b:q1> * o::Objec<>A<x:v> achieves ok this::C<b:q1> * res::Objec<>A<x:v> ;
    {
    o.toString();
    return o;
   }

    virtual A frame(A g) 
    static presumes this::C<b:q1> * g::A<x:v> achieves ok this::C<b:q1> * res::A<x:v> ;
    {
      A temp = this.id_generics(g);
    return temp;
  }

    virtual void nullPointerExceptionUnlessFrameFails() 
    static presumes this::C<b:q1> achieves err this::C<b:q1> * temp::A<x:null> & a=temp & s = null ;
    {
    A s = null;
    A temp = new A();
    Objec a = this.frame(temp);
    int y = a instanceof A;
    if (y == 1) {
      s.method();
    } else {}
  }
  }

  class D {
    int x;
  
  virtual int preconditionCheckStateTest(D d) 
  static presumes this::D<x:q1> * d::D<x:q2> achieves ok this::D<x:q1> * d::D<x:q2> & res=q2;
  { 
    int temp = d.x;
    return temp;
  }

  virtual void genericMethodSomewhereCheckingForNull(Objec s) 
  static presumes this::D<x:q1> * s::Objec<>A<x:v> achieves ok this::D<x:q1> * s::Objec<>A<x:v>;
  {
    if (s == null) {} else {}
  }

  virtual void noNullPointerExceptionAfterSkipFunction() 
  static presumes this::D<x:q1> achieves ok this::D<x:q1> * t::A<x:null> * a::A<x:null> *s1::A<x:null> & s1 = a;
  {
    Objec t = new A();
    int temp = 1;
    Objec s1 = t.canReturnNullObject(temp);
    this.genericMethodSomewhereCheckingForNull(s1);
    s1.toString();
  }

  virtual int hfoo(A h) 
  static presumes this::D<x:q1> * h::B<a:i> * i::A<x:p> achieves ok this::D<x:q1> * h::B<a:i> * i::A<x:p> * temp::A<x:p> & res = i & i = temp;
  {
    int temp = h.get();
    temp.toString();
    return temp;
  }

  virtual int hashNPE(A h, int k) 
  static presumes this::D<x:q1> * h::A<x:i> & k = i achieves ok this::D<x:q1> * h::A<x:i> & k = i & res = k + 1;
  static presumes this::D<x:q1> * h::A<x:i> & k != i achieves err this::D<x:q1> * h::A<x:i> & k != i;
  {
    int temp = h.match(k);
    int temp2 = temp + 1;
    return temp2;
  }

   virtual int NPEhashmapProtectedByContainsKey(A h, int k) 
   static presumes this::D<x:q1> * h::A<x:i> & k = i achieves ok this::D<x:q1> * h::A<x:i> & k = i & res = k + 1;
   static presumes this::D<x:q1> * h::A<x:i> & k != i achieves ok this::D<x:q1> * h::A<x:i> & k != i & res = 0;
   {
    int temp = h.x;
    if (temp != k) {
      return 0;
    } else {
    int temp2 = this.hashNPE(h, k);
    return temp2;
  }
  }

  }
  
  class Nullable {
  Objec mFld;

  virtual void FN_nullableFieldNPE() 
  static presumes this::Nullable<mFld:null> achieves err this::Nullable<mFld:null> & temp = null;
  static presumes this::Nullable<mFld:v> * v::Objec<> achieves ok this::Nullable<mFld:v> * v::Objec<> * temp::Objec<> & temp = v;
  {
    Objec temp = this.mFld;
    temp.toString();
  }

  virtual void guardedNullableFieldDeref() 
  static presumes this::Nullable<mFld:null> achieves ok this::Nullable<mFld:null> & temp = null;
  static presumes this::Nullable<mFld:v> * v::Objec<> achieves ok this::Nullable<mFld:v> * v::Objec<> * temp::Objec<> & temp = v;

  {
    Objec temp = this.mFld;
    if (temp != null) {temp.toString();} else {};
  }

  virtual void allocNullableFieldDeref() 
  static presumes this::Nullable<mFld:v> achieves ok this::Nullable<mFld:temp> * temp::Objec<> * temp2::Objec<> & temp2 = temp;
  static presumes this::Nullable<mFld:v> * v::Objec<> achieves ok this::Nullable<mFld:temp> * temp::Objec<> * temp2::Objec<> * v::Objec<>& temp2 = temp;

  {
    Objec temp = new Objec();
    this.mFld = temp;
    Objec temp2 = this.mFld;
    temp2.toString();
  }

  virtual void nullableParamNPE() 
  static presumes this::Nullable<mFld:v> * v::Objec<> achieves ok this::Nullable<mFld:v> * v::Objec<>& temp = v ;
 
  {
    Objec temp = this.mFld;
    temp.toString();
  }

  virtual void guardedNullableParamDeref( Object param) {
    if (param != null) param.toString();
  }

  virtual void allocNullableParamDeref( Object param) {
    param = new Object();
    param.toString();
  }
  }