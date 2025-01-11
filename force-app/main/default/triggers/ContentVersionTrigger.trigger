/**
 * @author            : Anirban Roy
 * @description       : Trigger for ContentVersion to handle actions after insert
 * @Created on        : 25-12-2024
 * @last modified by  : 25-12-2024
**/

trigger ContentVersionTrigger on ContentVersion (after insert) {
    
    if(Trigger.isAfter && Trigger.isInsert) {
        // Get the list of newly inserted ContentVersion records
        List<ContentVersion> versionList = Trigger.new;
        System.debug('On ContentVersion Insert => ' + JSON.serialize(versionList));
        
        for(ContentVersion versionObj: versionList) {
            // Query to fetch ContentDocument details related to the inserted ContentVersion record
            ContentVersion cVersion = [SELECT ContentDocument.Id, ContentDocument.Title, ContentDocument.Description FROM ContentVersion
                                       WHERE Id =: versionObj.Id];
            
            // Extract the related ContentDocument from the ContentVersion record
            ContentDocument cDocument = cVersion.ContentDocument;
            
            // Query to fetch all versions related to the same ContentDocument by ContentDocument Id
            List<ContentVersion> cVersionList = [SELECT Id, IsLatest, VersionNumber, ReasonForChange FROM ContentVersion WHERE Id =: versionObj.Id];
            
            // Query to fetch all ContentDocumentLink records associated with the ContentDocument
            List<ContentDocumentLink> cDocLinkList = [SELECT Id, LinkedEntityId FROM ContentDocumentLink WHERE ContentDocumentId =: cDocument.Id];
            
            // Further logic can be added to handle the fetched information as needed
        }
    }
}