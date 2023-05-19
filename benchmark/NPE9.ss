class CategoryAxis{

}

class CategoryPlot{
    CategoryAxis pre;   
    CategoryAxis ax;

    virtual void setDomainAxis2(int index, CategoryAxis axis, int notify) 
    static presumes this::CategoryPlot<pre:ppp,ax:iii> & index = u & notify = 1 & axis = null achieves this::CategoryPlot<pre:iii,ax:axis> & index = u & notify = 1 & axis = null;
    dynamic presumes this::CategoryPlot<pre:ppp,ax:iii> & index = u & notify = 1 & axis = null achieves this::CategoryPlot<pre:iii,ax:axis> & index = u & notify = 1 & axis = null;

    {
        int existing = this.ax;
        if (existing != null) {
            this.pre = existing;
        }
        if (axis != null) {
            axis.setPlot(this);
        }
        if (axis != null) {
            axis.configure();
            axis.addChangeListener(this);
        }
        if (notify) {
            if (index > 0) {
            this.ax = axis;}
        }
    }

    virtual void setDomainAxis1(int ind, CategoryAxis axi) 
    static presumes this::CategoryPlot<pre:pp,ax:ii> & ind = y & axi = null achieves this::CategoryPlot<pre:ii,ax:null> & ind = y & axi = null;
    dynamic presumes this::CategoryPlot<pre:pp,ax:ii> & ind = y & axi = null achieves this::CategoryPlot<pre:ii,ax:null> & ind = y & axi = null;
    {   
        int temp = 1;
        this.setDomainAxis2(ind, axi, temp);
    }

    virtual void setDomainAxis(CategoryAxis a) 
    static presumes this::CategoryPlot<pre:p,ax:i> & a = null achieves this::CategoryPlot<pre:i,ax:a> & a = null;
    dynamic presumes this::CategoryPlot<pre:p,ax:i> & a = null achieves this::CategoryPlot<pre:i,ax:a> & a = null;
    {   
        int temp1 = 0;
        this.setDomainAxis1(temp1, a);
    }

    virtual void setRangeAxis2(int index, CategoryAxis axis, int notify) 
    static presumes this::CategoryPlot<pre:ppp,ax:iii> & index = u & notify = 1 & axis = null achieves this::CategoryPlot<pre:iii,ax:axis> & index = u & notify = 1 & axis = null;
    dynamic presumes this::CategoryPlot<pre:ppp,ax:iii> & index = u & notify = 1 & axis = null achieves this::CategoryPlot<pre:iii,ax:axis> & index = u & notify = 1 & axis = null;

    {
        int existing = this.ax;
        if (existing != null) {
            this.pre = existing;
        }
        if (axis != null) {
            axis.setPlot(this);
        }
        if (axis != null) {
            axis.configure();
            axis.addChangeListener(this);
        }
        if (notify) {
            if (index > 0) {
            this.ax = axis;}
        }
    }

    virtual void setRangeAxis1(int ind, CategoryAxis axi) 
    static presumes this::CategoryPlot<pre:pp,ax:ii> & ind = y & axi = null achieves this::CategoryPlot<pre:ii,ax:null> & ind = y & axi = null;
    dynamic presumes this::CategoryPlot<pre:pp,ax:ii> & ind = y & axi = null achieves this::CategoryPlot<pre:ii,ax:null> & ind = y & axi = null;
    {   
        int temp = 1;
        this.setRangeAxis2(ind, axi, temp);
    }

    virtual void setRangeAxis(CategoryAxis a) 
    static presumes this::CategoryPlot<pre:p,ax:i> & a = null achieves this::CategoryPlot<pre:i,ax:a> & a = null;
    dynamic presumes this::CategoryPlot<pre:p,ax:i> & a = null achieves this::CategoryPlot<pre:i,ax:a> & a = null;
    {   
        int temp1 = 0;
        this.setRangeAxis1(temp1, a);
    }

    
}

class CombinedRangeCategoryPlot extends CategoryPlot {

    inherit void setDomainAxis2(int index, CategoryAxis axis, int notify) 
     static presumes this::CombinedRangeCategoryPlot<pre:ppp,ax:iii> & index = u & notify = 1 & axis = null achieves this::CombinedRangeCategoryPlot<pre:iii,ax:axis> & index = u & notify = 1 & axis = null;
     dynamic presumes this::CategoryPlot<pre:ppp,ax:iii>CombinedRangeCategoryPlot<> & index = u & notify = 1 & axis = null achieves this::CategoryPlot<pre:iii,ax:axis>CombinedRangeCategoryPlot<> & index = u & notify = 1 & axis = null;
    {
        
    }

    inherit void setDomainAxis1(int ind, CategoryAxis axi) 
    static presumes this::CombinedRangeCategoryPlot<pre:pp,ax:ii> & ind = y & axi = null achieves this::CombinedRangeCategoryPlot<pre:ii,ax:null> & ind = y & axi = null;
    dynamic presumes this::CategoryPlot<pre:pp,ax:ii>CombinedRangeCategoryPlot<> & ind = y & axi = null achieves this::CategoryPlot<pre:ii,ax:null>CombinedRangeCategoryPlot<> & ind = y & axi = null;
    {   
     
    }

    inherit void setDomainAxis(CategoryAxis a) 
    static presumes this::CombinedRangeCategoryPlot<pre:p,ax:i> & a = null achieves this::CombinedRangeCategoryPlot<pre:i,ax:a> & a = null;
    dynamic presumes this::CategoryPlot<pre:p,ax:i>CombinedRangeCategoryPlot<> & a = null achieves this::CategoryPlot<pre:i,ax:a>CombinedRangeCategoryPlot<> & a = null;
    {   
        
    }

    virtual void add(CategoryPlot subplot, int weight) 
    static presumes subplot::CategoryPlot<pre:e,ax:u> & weight > 0 achieves subplot::CategoryPlot<pre:u,ax:null> & weight > 0;
    static presumes subplot::CategoryPlot<pre:e,ax:u> & weight > 0 achieves err subplot::CategoryPlot<pre:u,ax:null> & weight > 0;

    {
        
        if (weight > 0) {
        int temp = null;
        subplot.setRangeAxis(temp);
              
    }
    }
}

class CombinedDomainCategoryPlot extends CategoryPlot {
    inherit void setDomainAxis2(int index, CategoryAxis axis, int notify) 
     static presumes this::CombinedDomainCategoryPlot<pre:ppp,ax:iii> & index = u & notify = 1 & axis = null achieves this::CombinedDomainCategoryPlot<pre:iii,ax:axis> & index = u & notify = 1 & axis = null;
     dynamic presumes this::CategoryPlot<pre:ppp,ax:iii>CombinedDomainCategoryPlot<> & index = u & notify = 1 & axis = null achieves this::CategoryPlot<pre:iii,ax:axis>CombinedDomainCategoryPlot<> & index = u & notify = 1 & axis = null;
    {
        
    }

    inherit void setDomainAxis1(int ind, CategoryAxis axi) 
    static presumes this::CombinedDomainCategoryPlot<pre:pp,ax:ii> & ind = y & axi = null achieves this::CombinedDomainCategoryPlot<pre:ii,ax:null> & ind = y & axi = null;
    dynamic presumes this::CategoryPlot<pre:pp,ax:ii>CombinedDomainCategoryPlot<> & ind = y & axi = null achieves this::CategoryPlot<pre:ii,ax:null>CombinedDomainCategoryPlot<> & ind = y & axi = null;
    {   
     
    }

    inherit void setDomainAxis(CategoryAxis a) 
    static presumes this::CombinedDomainCategoryPlot<pre:p,ax:i> & a = null achieves this::CombinedDomainCategoryPlot<pre:i,ax:a> & a = null;
    dynamic presumes this::CategoryPlot<pre:p,ax:i>CombinedDomainCategoryPlot<> & a = null achieves this::CategoryPlot<pre:i,ax:a>CombinedDomainCategoryPlot<> & a = null;
    {   
        
    }

    virtual void add(CategoryPlot subplot, int weight) 
    static presumes subplot::CategoryPlot<pre:e,ax:u> & weight > 0 achieves subplot::CategoryPlot<pre:u,ax:null> & weight > 0;
    static presumes subplot::CategoryPlot<pre:e,ax:u> & weight > 0 achieves err subplot::CategoryPlot<pre:u,ax:null> & weight > 0;

    {
        
        if (weight > 0) {
        int temp = null;
        subplot.setDomainAxis(temp);
              
    }
    }

}