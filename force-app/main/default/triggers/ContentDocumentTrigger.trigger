/**
 * @author            : Anirban Roy
 * @description       : Trigger for ContentDocument to handle actions after insert and delete
 * @Created on        : 25-12-2024
 * @last modified by  : 25-12-2024
**/

trigger ContentDocumentTrigger on ContentDocument (after insert, after delete) {
    
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            // Get the list of newly inserted ContentDocument records
            List<ContentDocument> documentList = Trigger.new;
            System.debug('On ContentDocument Insert => ' + JSON.serialize(documentList));
            
            for(ContentDocument documentObj : documentList) {
                // Query to fetch all ContentVersion records related to the inserted ContentDocument by ContentDocumentId
            	List<ContentVersion> cVersionList1 = [SELECT Id, Title, Description, VersionData, VersionNumber, IsLatest, ReasonForChange
                                                     FROM ContentVersion WHERE ContentDocumentId =: documentObj.Id];
                
                // Query to fetch the ContentVersion that is the latest published version for the ContentDocument
            	List<ContentVersion> cVersionList2 = [SELECT Id, Title, Description, VersionData, VersionNumber, ReasonForChange
                                                     FROM ContentVersion WHERE Id =: documentObj.LatestPublishedVersionId];
                
                // Further logic can be added to handle the fetched information as needed
            }
        }
        else if (Trigger.isDelete) {
            System.debug('On ContentDocument Delete => ' + JSON.serialize(Trigger.old));
        }
    }
}