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

  virtual int get()
  static presumes this::A<x:n> achieves this::A<x:n> & res = n;
  {
    int temp = this.x;
    return temp;
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

    virtual A get()
    static presumes this::B<a:r>  achieves ok this::B<a:r> & res = r;
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

  virtual int hfoo(B h) 
  static presumes this::D<x:q1> * h::B<a:i> * i::A<x:p> achieves ok this::D<x:q1> * h::B<a:i> * i::A<x:p>  & res = i & i = temp;
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
  static presumes this::Nullable<mFld:v> * v::Objec<> achieves ok this::Nullable<mFld:v> * v::Objec<> & temp = v ;
  {
    Objec temp = this.mFld;
    temp.toString();
  }

  virtual void guardedNullableParamDeref( Objec param) 
  static presumes this::Nullable<mFld:v> * param::Objec<> achieves ok this::Nullable<mFld:v> * param::Objec<> ;
   static presumes this::Nullable<mFld:v> & param = null achieves ok this::Nullable<mFld:v> & param = null  ;

  {
    if (param != null) {param.toString();}
  }

  virtual void allocNullableParamDeref(Objec param) 
  static presumes this::Nullable<mFld:v> * param::Objec<> achieves ok this::Nullable<mFld:v> * param::Objec<> ;
  {
    param = new Objec();
    param.toString();
  }

  virtual void nullableParamReassign1(Objec o) 
  static presumes this::Nullable<mFld:v> & o = null achieves ok this::Nullable<mFld:v> * o::Objec<>;
  {
    if (o == null) {
      o = new Objec();
    }
    o.toString();
  }

  virtual void nullableParamReassign2(Objec o, Objec okObj) 
  static presumes this::Nullable<mFld:v> * okObj::Objec<> & o = null achieves ok this::Nullable<mFld:v> * okObj::Objec<> & o = okObj;
  {
    if (o == null) {
      o = okObj;
    }
    o.toString();
  }

   virtual void nullableFieldReassign3(Objec o, Objec param) 
   static presumes this::Nullable<mFld:v> * o::Objec<> * param::Objec<> achieves ok this::Nullable<mFld:v> * o::Objec<> & o = param ;
   {
    o = param;
    o.toString();
  }

    virtual Objec nullableGetter(Objec o) 
    static presumes this::Nullable<mFld:v> * o::Objec<> achieves ok this::Nullable<mFld:v> * o::Objec<> & res = o;
    static presumes this::Nullable<mFld:v> & o = null achieves ok this::Nullable<mFld:v> & o = null & res = o;
    {
    return o;
  }

   virtual void FN_derefNullableGetter(Objec p) 
    static presumes this::Nullable<mFld:v> * p::Objec<> achieves ok this::Nullable<mFld:v> * p::Objec<> & q = p;
    static presumes this::Nullable<mFld:v> & p = null achieves err this::Nullable<mFld:v> & p = null & q = p;
   {
    Objec q = this.nullableGetter(p);
    q.toString();
  }

    virtual Objec nullableRet(boolean b) 
      static presumes this::Nullable<mFld:v> & b = 1 achieves ok this::Nullable<mFld:v> & b = 1 & res = null;
      static presumes this::Nullable<mFld:v> & b = 0 achieves ok this::Nullable<mFld:v> * res::Objec<> & b = 0 ;
    {
    if (b) {
      return null;
    } else {
    return new Objec();}
  }

  virtual void derefNullableRet(boolean z) 
    static presumes this::Nullable<mFld:v> & z = 0 achieves ok this::Nullable<mFld:v> * ret::Objec<> & z = 0;
    static presumes this::Nullable<mFld:v> & z = 1 achieves err this::Nullable<mFld:v> & ret = null & z = 1;
  {
    Object ret = this.nullableRet(z);
    ret.toString();
  }

  virtual void derefNullableRetOK(boolean z) 
    static presumes this::Nullable<mFld:v> & z = 0 achieves ok this::Nullable<mFld:v> * ret::Objec<> & z = 0;
    static presumes this::Nullable<mFld:v> & z = 1 achieves ok this::Nullable<mFld:v> & ret = null & z = 1;
  {
    Object ret = this.nullableRet(z);
    if (ret != null) {
      ret.toString();
    }
  }

  virtual void derefUndefNullableRet(Objec undefNullableRet) 
  static presumes this::Nullable<mFld:v> * undefNullableRet::Objec<>  achieves ok this::Nullable<mFld:v> * undefNullableRet::Objec<> & ret = undefNullableRet;
  static presumes this::Nullable<mFld:v> & undefNullableRet = null achieves err this::Nullable<mFld:v> & undefNullableRet = null & ret = undefNullableRet;
  {
    Object ret = undefNullableRet;
    ret.toString();
  }

  virtual void derefUndefNullableRetOK(Objec undefNullableRet) 
  static presumes this::Nullable<mFld:v> * undefNullableRet::Objec<>  achieves ok this::Nullable<mFld:v> * undefNullableRet::Objec<> & ret = undefNullableRet;
  static presumes this::Nullable<mFld:v> & undefNullableRet = null achieves ok this::Nullable<mFld:v> & undefNullableRet = null & ret = undefNullableRet;
  {
    Object ret = undefNullableRet;
    if (ret != null) {
      ret.toString();
    }
  }

  virtual void assumeUndefNullableIdempotentOk(Objec undefNullableRet) 
  static presumes this::Nullable<mFld:v> * undefNullableRet::Objec<>  achieves ok this::Nullable<mFld:v> * undefNullableRet::Objec<>;
  static presumes this::Nullable<mFld:v> & undefNullableRet = null achieves ok this::Nullable<mFld:v> & undefNullableRet = null;
  {
    if (undefNullableRet != null) {
      undefNullableRet.toString();
    }
  }

  virtual Object undefNullableWrapper(Objec undefNullableRet) 
  static presumes this::Nullable<mFld:v> * undefNullableRet::Objec<>  achieves ok this::Nullable<mFld:v> * undefNullableRet::Objec<> & res = undefNullableRet;
  static presumes this::Nullable<mFld:v> & undefNullableRet = null achieves ok this::Nullable<mFld:v> & undefNullableRet = null & res = undefNullableRet;
  {
    return undefNullableRet;
  }

  virtual void derefUndefNullableRetWrapper(Objec undef) 
  static presumes this::Nullable<mFld:v> * undef::Objec<>  achieves ok this::Nullable<mFld:v> * undef::Objec<> & q = undef;
  static presumes this::Nullable<mFld:v> & undef = null achieves err this::Nullable<mFld:v> & undef = null & q = undef;
  {
    Objec q = this.undefNullableWrapper(undef);
    q.toString();
  }

  virtual int returnsThreeOnlyIfRetNotNull(Objec obj) 
  static presumes this::Nullable<mFld:v> * obj::Objec<>  achieves ok this::Nullable<mFld:v> * obj::Objec<> & res = 3;
  static presumes this::Nullable<mFld:v> & obj = null achieves ok this::Nullable<mFld:v> & obj = null & res = 2;
  {
    if (obj == null) {
      return 2;
    } else {
    return 3;}
  }

  virtual void testNullablePrecision(Objec undefNullableRet) 
  static presumes this::Nullable<mFld:v> * undefNullableRet::Objec<>  achieves ok this::Nullable<mFld:v> * undefNullableRet::Objec<> & ret = undefNullableRet;
  static presumes this::Nullable<mFld:v> & undefNullableRet = null achieves ok this::Nullable<mFld:v> & undefNullableRet = null & ret = undefNullableRet;
  {
    Object ret = undefNullableRet;
    int temp = this.returnsThreeOnlyIfRetNotNull(ret);
    if ( temp == 3) {
      ret.toString(); 
    }
  }

  }

class Bl {
  int test1;

  int test2;

  virtual Objec getObj() 
  static presumes this::Bl<test1:1,test2:v>  achieves ok this::Bl<test1:1,test2:v> * res::Objec<>;
  static presumes this::Bl<test1:0,test2:v>  achieves ok this::Bl<test1:0,test2:v> & res=null;
  {
    int temp = this.test1;
    if (temp) {
      return new Objec();
    } else {
      return null;
    }
  }

  virtual Boolean getBool() 
  static presumes this::Bl<test1:v1,test2:1>  achieves ok this::Bl<test1:v1,test2:1> & res=1;
  static presumes this::Bl<test1:v1,test2:0>  achieves ok this::Bl<test1:v1,test2:0> & res=null;
  {
    int temp = this.test2;
    if (temp) {
      return true;
    } else {
      return null;
    }
  }

  virtual void derefGetterAfterCheckShouldNotCauseNPE() 
  static presumes this::Bl<test1:1,test2:v1>  achieves ok this::Bl<test1:1,test2:v1> * temp::Objec<>;
  static presumes this::Bl<test1:0,test2:v1>  achieves ok this::Bl<test1:0,test2:v1> & temp = null;
  {
    Objec temp = this.getObj();
    if (temp != null ) {
      temp.toString();
    }
  }

  virtual void derefBoxedGetterAfterCheckShouldNotCauseNPE() 
  static presumes this::Bl<test1:v1,test2:0>  achieves ok this::Bl<test1:v1,test2:0> ; 
  static presumes this::Bl<test1:v1,test2:1>  achieves ok this::Bl<test1:v1,test2:1> ;
  {
    int b1 = this.getBool();
     if (b1 != null) {
    int b2 = this.getBool();
    b2 = b2 + b1;
    b2 = b2 - 1;
    } else {int b2 = 0;}
  }
  
   virtual void badCheckShouldCauseNPE_latent() 
   static presumes this::Bl<test1:v1,test2:1>  achieves err this::Bl<test1:0,test2:1> & temp = null; 
   static presumes this::Bl<test1:1,test2:1>  achieves ok this::Bl<test1:1,test2:1> * temp::Objec<> ; 
   {
    int b1 = this.getBool();
    if (b1 != null) {
      Objec temp = this.getObj();
      temp.toString();
    }
  }

}

  class L {
    L next;

    virtual Object returnsNullAfterLoopOnList() 
    static presumes this::L<next:l>  achieves ok this::L<next:l> & res = null; 
    {
  }

   virtual void dereferenceAfterLoopOnList() 
    static presumes this::L<next:l>  achieves err this::L<next:l> & obj = null; 

   {
    Object obj = this.returnsNullAfterLoopOnList();
    obj.toString();
  }
  }

  class E {

    Objec nl;

  virtual Object getObject() 
  static presumes this::E<nl:l>  achieves ok this::E<nl:l> & res = null; 
  {
    return null;
  }

  virtual void incr_deref(A z) 
  static presumes this::E<nl:l> * z::A<x:v>  achieves ok this::E<nl:l> * z::A<x:v+1> ; 
  {
    int temp = z.x;
    temp = temp + 1;
    z.x = temp;
  }

  virtual void call_incr_deref_with_alias_bad() 
  static presumes this::E<nl:l>  achieves err this::E<nl:l> & a = null ; 
  {
    A a = new A();
    a.x = 0;
    this.incr_deref(a);
    this.incr_deref(a);
    int temp = a.x;
    if (temp == 2) {
      a = null;
    }
    a.x = 0;
  }

   virtual void call_incr_deref2_Ok() 
   static presumes this::E<nl:l>  achieves ok this::E<nl:l> * a::A<x:2> * a1::A<x:0> * a2::A<x:1> ; 
   {
    A a = new A();
    A a1 = new A();
    A a2 = new A();
    a.x = 0;
    a1.x = 0;
    a2.x = 0;
    this.incr_deref(a);
    this.incr_deref(a);
    this.incr_deref(a1);
    this.incr_deref(a2);
    int temp = a.x;
    int temp1 = a1.x;
    int temp2 = a2.x;

    
    if (temp1 != 1) { a1 = null;
    } else {
      if (temp2 != 1) {a1 = null;} else {
        if (temp != 2) {a1 = null;} else {
        }

      }
    }
    a1.x = 0;
  }


  }