public class MainObj {
    
    public String MainId_Name{get; set;}
    public User CreatedBy {get; set;}
    public User LModBy {get; set;}
    public String FComments {get; set;}
    public String LComments {get; set;}
    public String GComments {get; set;}
    public String ContactName {get; set;}
    public String Email {get; set;}
    public String Phone {get; set;}
    public String LocName {get; set;}
    public integer Found_Main_Id {get; set;}
    public List<LF_ItemMap__c> ItemTypes {set; get;}
    public User ownBy {get; set;}
    public string EType {get; set;}
    public date LDate {get; set;}
    public Id MId {get; set;}
}