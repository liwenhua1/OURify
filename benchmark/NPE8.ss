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
class DefaultPieDataset {
    int k;
    int v;

    virtual void setValue (int a, int b)
    presumes this::DefaultPieDataset<k:m,v:n> & a = f & b = u achieves this::DefaultPieDataset<k:f,v:u> & a = f & b = u ;
    {
        this.k = a;
        this.v = b;
    } 

  
}

class Stack {
   
  

  Stack ()
	static
		presumes true achieves  new_this::Stack<>;
	{}

    

    virtual void push (int a)
    presumes this::Stack<> achieves this::Stack<> ;
    {

    } 

     virtual Objec peek ()

     presumes this::Stack<> achieves this::Stack<> * res::Objec<>;
    {
	
    } 
}

class RootHandler {

    Stack subHandlers;
    
    RootHandler() 
    presumes true achieves new_this::RootHandler<subHandlers:sb> * sb::Stack<>;
    {
        Stack sb = new Stack();
        new_this.subHandlers  = sb;
        
    }

    virtual Stack getSubHandlers() 
    static presumes this::RootHandler<subHandlers:ww> achieves this::RootHandler<subHandlers:ww> & res = ww;
    dynamic presumes this::RootHandler<subHandlers:ww> achieves this::RootHandler<subHandlers:ww> & res = ww;
    {
        int e = this.subHandlers;
        return e;
    }

     virtual DefaultHandler getCurrentHandler() 
    static presumes this::RootHandler<subHandlers:sb> * sb::Stack<> achieves this::RootHandler<subHandlers:sb> * sb::Stack<> & res = this;
    dynamic presumes this::RootHandler<subHandlers:sb> * sb::Stack<> achieves this::RootHandler<subHandlers:sb> * sb::Stack<> & res = this;
    {
        int result = this;
        int temp = this.subHandlers;
         if ( temp != null) {
                Object top1 = this.subHandlers;
                int top = top1.peek();
                if (top != null) {
                    return result;
                }
            
        }
        return result;

    }

}

class PieDatasetHandler extends RootHandler {

 
    DefaultPieDataset dataset;

  
    PieDatasetHandler() 
    presumes true achieves new_this::PieDatasetHandler<subHandlers:sb,dataset:null> * sb::Stack<>;
    {
       Stack sb = new Stack();
       new_this.subHandlers = sb;
    }

    inherit Stack getSubHandlers() 
    static presumes this::PieDatasetHandler<subHandlers:sb,dataset:da> achieves this::PieDatasetHandler<subHandlers:sb,dataset:da> & res = sb;
    dynamic presumes this::RootHandler<subHandlers:sb>PieDatasetHandler<dataset:da> achieves this::RootHandler<subHandlers:sb>PieDatasetHandler<dataset:da> & res = sb;
    {
       
    }


   
    virtual PieDataset getDataset() 
    presumes this::PieDatasetHandler<subHandlers:sb,dataset:q> achieves this::PieDatasetHandler<subHandlers:sb,dataset:q> & res = q;
    {
        int e = this.dataset;
        return e;
    }

      virtual void addItem(int key, int value) 
      presumes this::PieDatasetHandler<subHandlers:sb,dataset:g> * g::DefaultPieDataset<k:j,v:k> & key = z & value = c achieves this::PieDatasetHandler<subHandlers:sb,dataset:g> * g::DefaultPieDataset<k:z,v:c>& key = z & value = c;

      {
        DefaultPieDataset v = this.dataset;
        v.setValue(key, value);
    }

    inherit DefaultHandler getCurrentHandler() 
    static presumes this::PieDatasetHandler<subHandlers:sb,dataset:g> * sb::Stack<> achieves this::PieDatasetHandler<subHandlers:sb,dataset:g> * sb::Stack<> & res = this;
    dynamic presumes this::RootHandler<subHandlers:sb>PieDatasetHandler<dataset:g> * sb::Stack<> achieves this::RootHandler<subHandlers:sb>PieDatasetHandler<dataset:g> * sb::Stack<> & res = this;
    {
        
    }

      virtual void startElement(String namespaceURI, String localName, int qName)
        presumes this::PieDatasetHandler<subHandlers:sb,dataset:g> * sb::Stack<> & qName = 2 achieves err this::PieDatasetHandler<subHandlers:sb,dataset:g> * sb::Stack<> & qName = 2;
                             {

        DefaultHandler current = this.getCurrentHandler();
        if (current != this) {
            
        }
        else {if (qName == 1) {
            this.dataset = new DefaultPieDataset();
        }
        else {if (qName == 2) {
            int subhandler= 6;
            Stack temp = this.getSubHandlers();
            temp.push(subhandler);
        }}}

    }

    virtual PieDatasetHandler test() 
    presumes true achieves ok y::PieDatasetHandler<subHandlers:sb,dataset:g> & sb=null;

    {
        PieDatasetHandler y = new PieDatasetHandler();
        return y;
    }

}

