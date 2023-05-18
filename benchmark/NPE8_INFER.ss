class DefaultPieDataset {
    int k;
    int v;

    public void setValue (int a, int b)

    {
        this.k = a;
        this.v = b;
    } 

  
}

class Stack1 {
   
  


    public Object peek ()
    {
	return new Object();
    } 
     public void push (int a)
    {

    } 
}

class RootHandler {

    Stack1 subHandlers;
    
    public RootHandler() 
    
    {
        Stack1 sb = new Stack1();
        this.subHandlers  = sb;
        
    }

    public Stack1 getSubHandlers() 

    {	
    	return this.subHandlers;
    }

     public RootHandler getCurrentHandler() 
   
    {
       RootHandler result = this;
        Stack1 temp = this.subHandlers;
         if ( temp != null) {
                Object top = this.subHandlers.peek();
                if (top != null) {
                    result = this;
                }
            
        }
        return result;

    }

}

class PieDatasetHandler extends RootHandler {

 
    DefaultPieDataset dataset;

  

   


   
    public DefaultPieDataset getDataset() 
   
    {
        DefaultPieDataset e = this.dataset;
        return e;
    }

      public void addItem(int key, int value) 
     

      {
        DefaultPieDataset v = this.dataset;
        v.setValue(key, value);
    }

    

      public void startElement(String namespaceURI, String localName, int qName)
       
                             {

        RootHandler current = this.getCurrentHandler();
        if (current != this) {
            
        }
        else {if (qName == 1) {
            this.dataset = new DefaultPieDataset();
        }
        else {if (qName == 2) {
            int subhandler= 6;
            getSubHandlers().push(subhandler);
            
        }}}

    }

  

}