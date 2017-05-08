public class LFHomeController {
    
    public List<MainObj> listOfRecords {set;}
    public Id EditMId {get;set;}
    public string searchstring {get; set;}
    
    public List<MainObj> getlistOfRecords(){
        
        //Class for LFHome View
        List<MainObj> listOfRecords = new List<MainObj>();
        
        //Main Object
        List<LF_Main__c> results = new List<LF_Main__c>();
        
        //Get data from Objects
        //Traverse from Child to Parent.
        //Get list of ItemMap(Junction) Object in subquery
        //Traverse subquery records in LFHome Page to display List of Lost ItemTypeName for each Entry
        //Assign to MainObj for LFHome Page Listview
        results = [select id,
                   name,
                   Lost_Comments__c,
                   General_Comments__c,
                   Found_Comments__c,
                   LostDate__c,
                   LF_Location_ID__r.LocName__c,
                   LF_Contact_ID__r.FName__c,
                   LF_Contact_ID__r.LName__c,
                   LF_Contact_ID__r.Email__c,
                   LF_Contact_ID__r.Phone__c,
                   LF_EntryType_ID__r.EntryName__c,
                   
                   (Select LF_ItemType_ID__r.ItemTypeName__c
                    from LF_ItemMap_Mains__r)
                   from LF_Main__c];
        
        
        
        //Populate custom object for LFHome view
        for(LF_Main__C obj : results){
            MainObj mObj = new MainObj();
            mObj.ContactName = obj.LF_Contact_ID__r.FName__c + '.' + obj.LF_Contact_ID__r.LName__c;
            mObj.LComments = obj.Lost_Comments__c;
            mObj.GComments = (obj.General_Comments__c == null ? 'No General Comments Specified' :  obj.General_Comments__c) ;
            mObj.LocName = obj.LF_Location_ID__r.LocName__c;
            mObj.ItemTypes = obj.LF_ItemMap_Mains__r;
            mObj.MainId_Name = obj.Name;
            mObj.LDate = obj.LostDate__c;
            mObj.EType = obj.LF_EntryType_ID__r.EntryName__c;
            mObj.Email = obj.LF_Contact_ID__r.Email__c;
            mObj.Phone = obj.LF_Contact_ID__r.Phone__c;
            mObj.MId = obj.Id;
            listOfRecords.add(mObj);          
        }
        
        return listOfRecords;
    }
    
    public PageReference EditLF()
    {
        System.debug(EditMId);
        return null;//Todo: Go to Edit Page
    }
    
    public void SearchLF(){
        
    }
}