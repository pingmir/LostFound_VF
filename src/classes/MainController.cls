public with sharing class MainController {
    
    //Private Declaration
    string defLF = 'Lost';//Default selection
    string lComm, gComm, FName,LName,Email,Phone = null;
    Date rptDate = null;
    List<String> selITypes = new List<String>();
    List<String> selLoc = new List<String>();
    
    public MainController() {
            rptDate = System.Date.today();
    }

    //GETS
    
    public List<String> getselLoc(){
    return this.selLoc;
    }
    
    public String getDefLF(){
        return defLF;
    }
    public Date getRptDate(){
        return rptDate;
    }
    public String getlComm(){
        return lComm;
    }
    public String getgComm(){
        return gComm;
    }
    public string getFName(){
        return FName;
    }
    public string getLName(){
        return LName;
    }
    public string getEmail(){
        return Email;
    }
    public string getPhone(){
        return Phone;
    }
    
    
    public List<String> getselITypes(){
        return this.selITypes;
    }
    public List<SelectOption> getItemTypes(){
        List<LF_ItemType__c> s = [Select ItemTypeName__c from LF_ItemType__c];
        List<SelectOption> o = new List<SelectOption>();
        
        for(LF_ItemType__c l : s)
            o.add(new SelectOption(l.ItemTypeName__c,l.ItemTypeName__c));
        
        return o;
    }
    public List<SelectOption> getLOrFOptions(){
            List<SelectOption> s = new List<SelectOption>();
            s.add(new SelectOption('Lost','Lost'));
            s.add(new SelectOption('Found','Found'));
            s.add(new SelectOption('LostFound','Lost and Found'));

            return s;
    }
    
    public List<SelectOption> getLocs(){
        List<LF_Location__c> locs = [Select LocName__c from LF_Location__c];
        List<SelectOption> lo = new List<SelectOption>();
        
        for(LF_Location__c loc : locs){
            lo.add(new SelectOption(loc.LocName__c,loc.LocName__c));
        }
        return lo;
    }
    
    //SETS
    public void setselLoc(List<String> selLoc) {
        this.selLoc = selLoc;
    }
    
    public void setlComm(string lComm) {
        this.lComm = lComm;
    }
    public void setFName(string FName){
        this.FName = FName;
    }
    public void setLName(string LName){
        this.LName = LName ;
    }
    public void setEmail(string Email){
         this.Email = Email;
    }
    public void setPhone(string Phone){
        this.Phone = Phone;
    }
    public void setgComm(string gComm) {
        this.gComm = gComm;
    }
    public void setDefLF(string defLF){
        this.defLF = defLF;
    }
    public void setRptDate(Date rptDate){
        if(rptDate == null)
            this.rptDate = Date.newInstance(1960, 2, 17);
        else
        this.rptDate = rptDate;
    }
    public void setselITypes(List<String> selITypes){
        this.selITypes = selITypes;
    }
    
    
    
    
    
    //Save
    public void SaveLF(){
     
        //Insert Contact info
        LF_Contact__c c = new LF_Contact__c();
        c.Email__c = this.Email;
        c.Phone__c = this.Phone;
        c.FName__c = this.FName;
        c.LName__c = this.LName;

        //Insert Location
       // LF_Location__c loc = new LF_Location__c();
        //loc.LocName__c = 
        
        //Insert Main Object
        
        
        //MainObj m  = new MainObj();
        //m.GComments = this.gComm;
        //m.CreatedBy = UserInfo.getName();
        
                

        
    }

}