public with sharing class MainController {

    public MainController() {
        rptDate = System.Date.today();
    }

    public Date rptDate {get;set;}
    
    public String lComm{set; get;}
    public String gComm {get; set;}
    public string FName {get; set;}
    public string LName {get; set;}
    public string Email {get; set;}
    public string Phone{get; set;}
    public List<Id> selITypes {set; get;}
	public Id selLocId {set;get;}
    public Id selEntry {set;get;}
    
    public List<SelectOption> getItemTypes(){
        List<LF_ItemType__c> s = [Select Id,ItemTypeName__c from LF_ItemType__c];
        List<SelectOption> o = new List<SelectOption>();
        
        for(LF_ItemType__c l : s)
            o.add(new SelectOption(l.Id,l.ItemTypeName__c));
        
        return o;
    }
    public List<SelectOption> getLOrFOptions(){
        List<LF_EntryType__c> e = [select EntryName__c from LF_EntryType__c];
        
        List<SelectOption> s = new List<SelectOption>();
        for(LF_EntryType__c eT : e){
            s.add(new SelectOption(eT.Id,eT.EntryName__c));
        }
        
        return s;
    }
    
    public List<SelectOption> getLocs(){
        List<LF_Location__c> locs = [Select Id,LocName__c from LF_Location__c];
        List<SelectOption> lo = new List<SelectOption>();
        
        for(LF_Location__c loc : locs){
            lo.add(new SelectOption(loc.Id,loc.LocName__c));
        }
        return lo;
    }
    
   
    
    //Save
    public PageReference SaveLF(){
        
        //Insert Contact info
        try
        {
            LF_Contact__c c = new LF_Contact__c();
            c.Email__c = this.Email;
            c.Phone__c = this.Phone;
            c.FName__c = this.FName;
            c.LName__c = this.LName;
            upsert c;
            
            
            //Insert Main Object
            LF_Main__c m = new LF_Main__c();
            m.Lost_Comments__c = this.lComm;
            m.General_Comments__c = this.gComm;
            m.Found_Comments__c = this.lComm;
            m.LF_Location_ID__c = this.selLocId;
            m.LF_Contact_ID__c = c.Id;
            m.LostDate__c = this.rptDate;
            m.LF_EntryType_ID__c = this.selEntry;
            
            upsert m;
            
            //Insert in ItemMaps (Junction)
            List<LF_ItemMap__c> toInsert = new List<LF_ItemMap__c>();
            for(String selId: selITypes){
                LF_ItemMap__c i = new LF_ItemMap__c();
                i.LF_Main_ID__c = m.Id;
                i.LF_ItemType_ID__c = selId;
                toInsert.add(i);
            }
            
            upsert toInsert;
            
            PageReference homePage = Page.LFHome;
            homePage.setRedirect(true);
            return homePage;
        }
        Catch(DmlException d)
        {
            System.debug(d.getMessage());
            return null;
        }
    }
}