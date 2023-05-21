class Objec {

	Objec ()
	static
		presumes true achieves  new_this::Objec<>;
	{}
    
	virtual void toString()
	static	
	      presumes this::Objec<> achieves  this::Objec<>;
	dynamic	
	      presumes this::Objec<> achieves  this::Objec<>;
	{}

} 
class Integer extends Objec {

}
class Str extends Objec{

}


class Super {
    
    int val;

    virtual void set(int x) 
    static presumes this::Super<val:v> & x = w achieves this::Super<val:w> & x = w ;
    dynamic presumes this::Super<val:v> & x = w achieves this::Super<val:w> & x = w & w > 0 ;
    {   
        int n = x;
        this.val = x;
    }  


}

class Sub extends Super{
    

    override void set(int x) 
    static presumes this::Sub<val:v> & x = w achieves this::Sub<val:w>& x=w ;
    dynamic presumes this::Super<val:v>Sub<> & x = w achieves this::Super<val:w>Sub<> & x=w & w=1;
    {
        this.val = x;
    }  


}

class Test {

    virtual void test(Super q) 
    static presumes this::Test<> * q::Super<val:v>Sub<> achieves err this::Test<> * q::Super<val:1>Sub<>;
    {
       int temp = 1;
       q.set(temp);
       int temp2;
       int y = 1;
       if (y) {temp2.to_string();} else 
            {}
    }

      virtual void error (Objec a)
    static
        presumes this::Test<> * a::Objec<>Str<> achieves err this::Test<> * a::Objec<>;
    static
        presumes this::Test<> * a::Objec<>Str<> achieves ok this::Test<> * a::Objec<>;
    static
        presumes this::Test<> * a::Str<> achieves ok this::Test<> * a::Str<> & b=a;
    static
        presumes this::Test<> * a::Str<> achieves err this::Test<> * a::Str<> & b=a;
    static
        presumes this::Test<> * a::Objec<>Integer<> achieves err this::Test<> * a::Objec<>Integer<>;
    {
        Str b = (Str) a;
    }
} 