# Understanding the Salesforce File System 📂

<img 
  src="https://raw.githubusercontent.com/IAm-RoyAnirban/Salesforce-Files-System/refs/heads/main_branch/assets/salesforce-file-system-relationships-diagram.gif" alt="Salesforce File System Object Relationships Diagram" title="Salesforce File System - Object Relationships Diagram" width="65%" style="display: block; margin: 0 auto;" />

---

Explore how Salesforce manages files using the **ContentDocument**, **ContentVersion**, and **ContentDocumentLink** objects. This repository includes detailed resources and examples from my YouTube demonstration.

### 🎥 Watch the Video Tutorial to learn more:
YouTube: [Mastering Salesforce File Management System with Practical Use Cases](https:www.google.com)

---

## Overview

This repository is designed for developers and Salesforce admins who want to:

- **Understand relationships** between the `ContentDocument`, `ContentVersion`, and `ContentDocumentLink` objects: their fields, usage, and purpose.
- Learn **Apex trigger-based scenarios** using SOQL queries to handle file uploads, updates, deletions, and record associations.
- Explore **real-world use cases**, including:
  - Querying all related files and their versions for any record using Flows.
  - Previewing files in a data table.
  - Generating **secure, shareable links** with optional expiration dates and passwords for external access.

---

## Key Points to Note ⚠️

1. **On File Upload/Insert**:
   - All three objects—`ContentDocument`, `ContentVersion`, and `ContentDocumentLink`—triggers are fired.

2. **On Uploading a New Version of a File**:
   - Only the `ContentVersion` trigger is fired.

3. **On Removing a File from a Record**:
   - The `ContentDocumentLink` trigger is fired on deletion, identifying the related record using the `LinkedEntityId`.

4. **On Deleting a File from Salesforce**:
   - Only the `ContentDocument` trigger is fired.

---

## Salesforce Documentation References
- [ContentDocument, ContentVersion, and ContentDocumentLink Terminologies](https://help.salesforce.com/s/articleView?id=000393095&type=1)
- [Trigger Behavior in Classic and Lightning Experience](https://help.salesforce.com/s/articleView?id=000381623&type=1)

---

## 📚 Installation & Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/IAm-RoyAnirban/Salesforce-File-System.git

---

### Contributions
Feel free to fork this repository and contribute by submitting issues or pull requests. If you encounter any issues or need additional features, please raise a GitHub issue.

---

### License
This project is licensed under the MIT License - see the [LICENSE file](https://github.com/IAm-RoyAnirban/Salesforce-Files-System/blob/main_branch/LICENSE) for more details.
