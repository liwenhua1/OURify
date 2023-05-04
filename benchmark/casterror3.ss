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
        presumes this::ClassCastExceptions<>  achieves err this::ClassCastExceptions<> * i::MyInterface<>AnotherImplementationOfInterface<>;
  
  {
    AnotherImplementationOfInterface temp = new AnotherImplementationOfInterface();
    int temp2 = this.classCastExceptionImplementsInterfaceCalleeOk(temp);
    return temp2;
  }

}

