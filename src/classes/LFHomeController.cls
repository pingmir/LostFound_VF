public class LFHomeController {

    public List<MainObj> listOfRecords {set;}
    
    public List<MainObj> getlistOfRecords(){
        
        //Class for LFHome View
        List<MainObj> listOfRecords = new List<MainObj>();

        //Main Object
        List<LF_Main__c> results = new List<LF_Main__c>();
        
        //Get data from Objects
        results = [select id,name,Lost_Comments__c,General_Comments__c,Found_Comments__c,LostDate__c,
             LF_Location_ID__r.LocName__c,
             LF_Contact_ID__r.FName__c,
             LF_Contact_ID__r.LName__c,
             LF_Contact_ID__r.Email__c,
             LF_Contact_ID__r.Phone__c
             from LF_Main__c];
        
        //Populate custom object for LFHome view
        for(LF_Main__C obj : results){
				MainObj mObj = new MainObj();
            	mObj.ContactName = obj.LF_Contact_ID__r.FName__c + '.' + obj.LF_Contact_ID__r.LName__c;
            	mObj.LComments = obj.Lost_Comments__c;
            	mObj.GComments = (obj.General_Comments__c == null ? 'No General Comments Specified' :  obj.General_Comments__c) ;
            	mObj.LocName = obj.LF_Location_ID__r.LocName__c;

          listOfRecords.add(mObj);          
        }
            
        return listOfRecords;
   }
       
}