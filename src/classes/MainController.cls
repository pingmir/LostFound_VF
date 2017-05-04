public with sharing class MainController {

	String dSelect = null;
	Date rptDate = null;
	List<LF_ItemType__c> iTypes = new List<LF_ItemType__c>();


	public MainController() {
		
	}

    public String getDSelect() {
        return dSelect;
    }
                    
    public void setDSelect(String dSelect) { this.dSelect = 'Lost'; }
                    


	public List<SelectOption> getLOrFOptions(){

			List<SelectOption> s = new List<SelectOption>();
			s.add(new SelectOption('Lost','Lost'));
			s.add(new SelectOption('Found','Found'));
			s.add(new SelectOption('Lost and Found','LostFound'));

			return s;
	}



	public Date getRptDate(){
		return rptDate;
	}
	public void setRptDate(Date rptDate){
		if(rptDate == null)
			this.rptDate = Date.newInstance(1960, 2, 17);
		else
		this.rptDate = rptDate;
	}

	//Item Type select list
	public List<LF_ItemType__c> getItemTypes(){
		List<LF_ItemType__c> s = [Select ItemTypeName__c from LF_ItemType__c];
		return s;
	}

	public List<LF_ItemType__c> getITypes(){
		return this.iTypes;
	}

	public  void setITypes(List<LF_ItemType__c> iTypes){
		this.iTypes = iTypes;
	}


}