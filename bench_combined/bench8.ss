class Ctelement{
    virtual Ctelement getparent()
    static 
        presumes this::Ctelement<> achieves this::Ctelement<>*res::Ctelement<>CtExecutable<>;
    dynamic
        presumes this::Ctelement<> achieves this::Ctelement<>*res::Ctelement<>CtExecutable<>;
    {

    }
}

class CtVariable extends Ctelement{

    inherit Ctelement getparent()
    static 
        presumes this::CtVariable<> achieves this::CtVariable<>*res::Ctelement<>CtExecutable<>;
    dynamic
        presumes this::Ctelement<>CtVariable<> achieves this::Ctelement<>CtVariable<>*res::Ctelement<>CtExecutable<>;
    {

    }

}

class CtParameter extends CtVariable {
    inherit Ctelement getparent()
    static 
        presumes this::CtParameter<> achieves this::CtParameter<>*res::Ctelement<>CtExecutable<>;
    dynamic
        presumes this::Ctelement<>CtVariable<>CtParameter<> achieves this::Ctelement<>CtVariable<>CtParameter<>*res::Ctelement<>CtExecutable<>;
    {

    }
}

class CtLambda extends CtExecutable {


}
class CtMethod extends CtExecutable {

}

class CtExecutable extends Ctelement{

}

class Test {

    virtual void casterror(CtVariable a) 
    static 
        presumes this::Test<> * a::CtVariable<>CtParameter<> achieves err this::Test<> * a::CtVariable<>CtParameter<> * s::Ctelement<>CtExecutable<>;
        
    {
      int y = a instanceof CtParameter;
      if (y) {
            Object s = a.getparent();
            int x = s instanceof CtLambda;
            if (x) {} else 
            {CtMethod z = (CtMethod) s;}

     }
      
    }
}

class SuperClass {}

class SubClassA extends SuperClass {

  SubClassA()
  static presumes true achieves new_this::SubClassA<>;
  {

  }

}

class SubClassB extends SuperClass {

  SubClassB()
  static presumes true achieves new_this::SubClassB<>;
  {

  }
}

class MyInterface {

}

class ImplementationOfInterface extends MyInterface {

  virtual int getInt() 
  static 
        presumes this::ImplementationOfInterface<> & true achieves ok this::ImplementationOfInterface<> & res = 0;
  
  {
    int temp = 0;
    return temp;
  }
}

class AnotherImplementationOfInterface extends MyInterface {

  AnotherImplementationOfInterface()
   static presumes true achieves new_this::AnotherImplementationOfInterface<>;
  {

  }

  virtual int getInt() 
  static 
        presumes this::AnotherImplementationOfInterface<> & true achieves ok this::AnotherImplementationOfInterface<> & res = 1;
  {
    int temp = 1;
    return temp;
  }
}

 class ClassCastExceptions {

  virtual void classCastExceptionBad() 
  static 
        presumes this::ClassCastExceptions<> achieves err this::ClassCastExceptions<> * a::SubClassA<>;
  {
    SuperClass a = new SubClassA();
    SubClassB b = (SubClassB) a;
  }

  virtual int classCastExceptionImplementsInterfaceCalleeOk(MyInterface i) 
      static 
        presumes this::ClassCastExceptions<> * i::MyInterface<>ImplementationOfInterface<> achieves err this::ClassCastExceptions<> * i::MyInterface<>;
      static 
        presumes this::ClassCastExceptions<> * i::ImplementationOfInterface<> achieves ok this::ClassCastExceptions<> * impl::ImplementationOfInterface<> * i::ImplementationOfInterface<> & impl = i & res = 0;
      static 
        presumes this::ClassCastExceptions<> * i::MyInterface<>AnotherImplementationOfInterface<> achieves err this::ClassCastExceptions<> * i::MyInterface<>AnotherImplementationOfInterface<>;

  {
    ImplementationOfInterface impl = (ImplementationOfInterface) i;
    int temp = impl.getInt();
    return temp;
  }

  virtual int classCastExceptionImplementsInterfaceBad() 
  static 
        presumes this::ClassCastExceptions<>  achieves err this::ClassCastExceptions<> * temp::MyInterface<>AnotherImplementationOfInterface<>;
  
  {
    AnotherImplementationOfInterface temp = new AnotherImplementationOfInterface();
    int temp2 = this.classCastExceptionImplementsInterfaceCalleeOk(temp);
    return temp2;
  }

}

class AbstractHistogram {
	
}

class Cnt {
    int val;
	virtual bool equals (Object other) 
	static presumes this::Cnt<val:v> * other::Object<>AbstractHistogram<> achieves err this::Cnt<val:v> * other::AbstractHistogram<> ;
	dynamic presumes this::Cnt<val:v> * other::Object<>AbstractHistogram<> achieves err this::Cnt<val:v> * other::AbstractHistogram<> ;

	{   int y = other instanceof AbstractHistogram;
		if (y > 0 ) {
			DoubleHistogram otherHistogram = (DoubleHistogram) other;
		}
	}

}