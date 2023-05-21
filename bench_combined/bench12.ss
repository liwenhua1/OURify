 class Interface{}

 class Objec {
    
	virtual void toString()
	static	
	      presumes this::Objec<> achieves  this::Objec<>;
	dynamic	
	      presumes this::Objec<> achieves  this::Objec<>;
	{}
   Objec ()
	static
		presumes true achieves new_this::Objec<>;
	{}
} 
 
 class Impl extends Interface{
   
    virtual Objec foo() 
    static presumes this::Impl<> achieves ok this::Impl<> & res = null;
    {
      return null;
    }
  
    Impl ()
	static
		presumes true achieves new_this::Impl<>;
	{}

  virtual void interfaceShouldNotCauseFalseNegativeEasyBad() 
  static presumes this::Impl<> achieves err this::Impl<> * i::Impl<> & m = null;
  {
    Interface i = new Impl();
    Objec m = i.foo();
    m.toString();
  }

  virtual void FN_interfaceShouldNotCauseFalseNegativeHardOK(Interface i) 
  static presumes this::Impl<> * i::Impl<> achieves err this::Impl<> * i::Impl<> & m = null;
  {
    Objec m = i.foo();
    m.toString();
  }

  virtual void callWithBadImplementationBad_FN(Impl impl) 
  static presumes this::Impl<> * impl::Impl<> achieves err this::Impl<> * impl::Impl<>;
  {
    this.FN_interfaceShouldNotCauseFalseNegativeHardOK(impl);
  } 
 }

class Supertype {
    Supertype ()
	static
		presumes true achieves new_this::Supertype<>;
	{}


    virtual Objec foo() 
    static presumes this::Supertype<> achieves this::Supertype<> * res::Objec<>;
	dynamic presumes this::Supertype<> achieves this::Supertype<> * res::Objec<>;
    {
      return new Objec();
    }

    virtual Objec bar() 
    static presumes this::Supertype<> achieves this::Supertype<> & res = null;
	dynamic presumes this::Supertype<> achieves this::Supertype<> & res = null;
    {
      return null;
    }
  }

class Subtype extends Supertype {

    Subtype ()
	static
		presumes true achieves new_this::Subtype<>;
	{}
   
    override Objec foo() 
    static presumes this::Subtype<> achieves this::Subtype<> & res = null;
	dynamic presumes this::Subtype<> achieves this::Subtype<> & res = null; 
	dynamic presumes this::Supertype<> achieves this::Supertype<> * res::Objec<>; 	
    {
      return null;
    }

    
    override Objec bar() 
    static presumes this::Subtype<> achieves this::Subtype<> * res::Objec<>;
	dynamic presumes this::Subtype<> achieves this::Subtype<> * res::Objec<>; 
	dynamic presumes this::Supertype<> achieves this::Supertype<> & res = null; 	
    {
      return new Objec();
    }

    virtual void dynamicDispatchShouldNotCauseFalseNegativeEasyBad() 
    static presumes this::Subtype<> achieves  err this::Subtype<> * o::Subtype<> & temp = null;
    {
    Supertype o = new Subtype();
    Objec temp =  o.foo();
    temp.toString();
  }

  virtual void dynamicDispatchShouldNotCauseFalsePositiveEasyOK() 
  static presumes this::Subtype<> achieves this::Subtype<> * o::Subtype<> * temp::Objec<>;
  {
    Supertype o = new Subtype();
    Objec temp =  o.bar();
    temp.toString();
  }

  virtual void dynamicDispatchShouldNotReportWhenCallingSupertypeOK(Supertype o) 
  static presumes this::Subtype<> * o::Supertype<> achieves this::Subtype<> * o::Supertype<> * temp::Objec<>;
  static presumes this::Subtype<> * o::Subtype<> achieves err this::Subtype<> * o::Subtype<> & temp = null;
  {
    Objec temp =  o.foo();
    temp.toString();
  }

  virtual void dynamicDispatchShouldReportWhenCalledWithSubtypeParameterBad_FN(Subtype o) 
  static presumes this::Subtype<> * o::Subtype<> achieves err this::Subtype<> * o::Subtype<>;
  {
    this.dynamicDispatchShouldNotReportWhenCallingSupertypeOK(o);
  }

  virtual Object dynamicDispatchWrapperFoo(Supertype o) 
  static presumes this::Subtype<> * o::Supertype<> achieves this::Subtype<> * o::Supertype<> * res::Objec<>;
  static presumes this::Subtype<> * o::Subtype<> achieves  this::Subtype<> * o::Subtype<> & res = null;
  {
    int temp = o.foo();
    return temp;
  }

  virtual Object dynamicDispatchWrapperBar(Supertype o) 
    static presumes this::Subtype<> * o::Subtype<> achieves this::Subtype<> * o::Subtype<> * res::Objec<>;
    static presumes this::Subtype<> * o::Supertype<> achieves  this::Subtype<> * o::Supertype<> & res = null;
  {
    int temp = o.bar();
    return temp;
  }

  virtual void dynamicDispatchCallsWrapperWithSupertypeOK() 
  static presumes this::Subtype<> achieves this::Subtype<> * q::Supertype<> * temp::Objec<>;
  {
   
    Supertype q = new Supertype();
    Objec temp=this.dynamicDispatchWrapperFoo(q);
    temp.toString();
  }

  virtual void dynamicDispatchCallsWrapperWithSupertypeBad() 
  static presumes this::Subtype<> achieves err this::Subtype<> * q::Supertype<> & temp=null;
  {
    
    Supertype q = new Supertype();
    Objec temp= this.dynamicDispatchWrapperBar(q);
    temp.toString();
  }

  virtual void dynamicDispatchCallsWrapperWithSubtypeBad() 
    static presumes this::Subtype<> achieves err this::Subtype<> * q::Subtype<> & temp=null;
  {

    Supertype q = new Subtype();
     Objec temp= this.dynamicDispatchWrapperFoo(q);
     temp.toString();
  }

  virtual void dynamicDispatchCallsWrapperWithSubtypeOK() 
  static presumes this::Subtype<> achieves this::Subtype<> * q::Subtype<> * temp::Objec<>;
  {
   
    Supertype q = new Subtype();
    Objec temp= this.dynamicDispatchWrapperBar(q);
    temp.toString();
  }
}

class WithField {

    Supertype mField;

    WithField(Supertype t) 
    static presumes t::Subtype<> achieves new_this::WithField<mField:t> * t::Subtype<>;
    static presumes t::Supertype<> achieves new_this::WithField<mField:t> * t::Supertype<>;
    
    {
      new_this.mField = t;
    }

    virtual void dispatchOnFieldOK() 
    static presumes this::WithField<mField:q> achieves this::WithField<mField:q> * subtype::Subtype<> * object::WithField<mField:subtype> * temp::Objec<> & k=subtype;
    {
      Supertype subtype = new Subtype();
      WithField object = new WithField(subtype);
      Supertype k = object.mField;
      Objec temp =k.bar();
      temp.toString();
    }

    virtual void dispatchOnFieldBad() 
    static presumes this::WithField<mField:q> achieves err this::WithField<mField:q> * subtype::Subtype<> * object::WithField<mField:subtype> & temp = null & k=subtype;

    {
      Supertype subtype = new Subtype();
      WithField object = new WithField(subtype);
      Supertype k = object.mField;
      Objec temp =k.foo();
      temp.toString();
    }
  

  virtual Object callFoo(Supertype e) 
  static presumes this::WithField<mField:q> * e::Supertype<> achieves this::WithField<mField:q> * e::Supertype<> * res::Objec<>;
  static presumes this::WithField<mField:q> * e::Subtype<> achieves this::WithField<mField:q> * e::Subtype<> & res = null;
  {
    int temp = e.foo();
    return temp;
  }

  virtual void dynamicResolutionWithPrivateMethodBad()  
  static presumes this::WithField<mField:q> achieves err this::WithField<mField:q> * subtype::Subtype<> & temp = null;
  {
    Supertype subtype = new Subtype();
    Objec temp = this.callFoo(subtype);
    temp.toString();
  }

}

class A {

    A()
    static
		presumes true achieves new_this::A<>;
	{}

    virtual int foo() 
    static presumes this::A<>  achieves this::A<> & res = 32;
    dynamic presumes this::A<>  achieves this::A<> & res = 32;
    {
      return 32;
    }
  }

  class B extends A {

    B()
    static
		presumes true achieves new_this::B<>;
	{}

    override int foo() 
    static presumes this::B<>  achieves this::B<> & res = 52;
    dynamic presumes this::B<>  achieves this::B<> & res = 52;
    dynamic presumes this::A<>  achieves this::A<> & res = 32;
    {
      return 52;
    }
  }

  class C extends B {

    C()
    static
		presumes true achieves new_this::C<>;
	{}


    inherit int foo() 
    static presumes this::C<>  achieves this::C<> & res = 52;
    dynamic presumes this::A<>  achieves this::A<> & res = 32;
    dynamic presumes this::B<>C<>  achieves this::B<>C<> & res = 52;
    {
    }

  

  virtual A getB() 
  static presumes this::C<>  achieves this::C<> * res :: B<>;
  {
    return new B();
  }

  virtual A getC() 
  static presumes this::C<>  achieves this::C<> * res :: C<>;
  {
    return new C();
  }

  virtual void dispatch_to_B_ok() 
  static presumes this::C<>  achieves ok this::C<> * b :: B<>;
  
  {
    A b = this.getB();
    int temp = b.foo();
    if (temp == 32) {
      Objec o = null;
      o.toString();
    }
  }

  virtual void dispatch_to_B_bad() 
  static presumes this::C<>  achieves err this::C<> * b :: B<> & o = null;
  {
    A b = this.getB();
    int temp = b.foo();
    if (temp == 52) {
      Objec o = null;
      o.toString();
    }
  }

  virtual void dispatch_to_A_bad() 
  static presumes this::C<>  achieves err this::C<> * a :: A<> & o = null;
  {
    A a = new A();
    int temp = a.foo();
    if (temp == 32) {
      Object o = null;
      o.toString();
    }
  }

  virtual void dispatch_to_C_bad() 
  static presumes this::C<>  achieves err this::C<> * c :: C<> & o = null;
  {
    A c = this.getC();
    int temp = c.foo();
    if (temp == 52) {
      Objec o = null;
      o.toString();
    }
  }
  }