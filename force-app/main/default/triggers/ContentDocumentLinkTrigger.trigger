/**
 * @author            : Anirban Roy
 * @description       : Trigger for ContentDocumentLink to handle actions after insert and delete
 * @Created on        : 25-12-2024
 * @last modified by  : 25-12-2024
**/

trigger ContentDocumentLinkTrigger on ContentDocumentLink (after insert, after delete) {
    
    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            // Get the list of newly inserted ContentDocumentLink records
            List<ContentDocumentLink> docLinkList = Trigger.new;
            System.debug('On ContentDocumentLink Insert => ' + JSON.serialize(Trigger.new));
            
            for(ContentDocumentLink cDocLinkObj : docLinkList) {
                // Query to fetch related ContentDocument and its latest published ContentVersion
                ContentDocumentLink cdl = [SELECT Id, ContentDocument.ContentSize, ContentDocument.FileExtension, ContentDocument.FileType,
                                           ContentDocument.LatestPublishedVersion.Id, ContentDocument.LatestPublishedVersion.Title,
                                           ContentDocument.LatestPublishedVersion.FileExtension, ContentDocument.LatestPublishedVersion.VersionData
                                           FROM ContentDocumentLink WHERE Id =: cDocLinkObj.Id];
                
                // Fetch the related ContentDocument information
                ContentDocument cDoc = cdl.ContentDocument;
                
                // Fetch the latest published ContentVersion information for the ContentDocument
                ContentVersion cVersion = cdl.ContentDocument.LatestPublishedVersion;
                
                // Further logic can be added to handle the fetched information as needed
            }
        }
        else if (Trigger.isDelete) {
            System.debug('On ContentDocumentLink Delete => ' + JSON.serialize(Trigger.old));
        }
    }
}