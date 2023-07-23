# 3-Tier Architecture for WordPress Web App on Azure

## Introduction:

The 3-tier architecture is a common setup for deploying web applications. In this document, I have described my 3-tier architecture used to deploy a WordPress web app on Microsoft Azure using Azure SQL Database. Here is the basic diagram for my application.

Link to this web app: [https://aibook.azurewebsites.net/](https://aibook.azurewebsites.net/)

  <img width="802" alt="image" src="https://github.com/50ur48h/TechChallenge/assets/130345252/38006540-5e03-435c-9203-54c51b008525">

And here is the list of resources which has been created to run this web app.


  <img width="917" alt="image" src="https://github.com/50ur48h/TechChallenge/assets/130345252/dd31a9d6-64b3-41f7-a2f4-c30f7924f938">


---


### So let's understand this 3-tier architecture:


## 1. Presentation Tier (Tier 1): 

  The presentation tier, also known as the front-end tier, is the first layer that users interact with. In the case of the WordPress web app, the presentation tier consists of an Azure App Service named **"aibook,"** which is a PaaS service that allows hosting web applications without managing the underlying infrastructure.
      
  Additionally, a Content Delivery Network (CDN) profile named **`aibook-ac5a19d9876ed04f6f30-cdnprofile`** is used to enhance the performance of the web app by caching and delivering static content from edge servers located worldwide, reducing latency for users accessing the website from different regions.
      
  All the source code for this WordPress app can be found in [aibook](https://github.com/50ur48h/TechChallenge/tree/main/Challenge-01/aibookapp) folder of this repository under the Challenge-01 section.

---

## 2. Application Tier (Tier 2):

The application tier, also known as the middle tier, is responsible for processing application logic and data manipulation. In this WordPress web app setup, the application tier primarily relies on the WordPress software itself, which handles the core functionality of content management, user authentication, and other dynamic aspects of the website.

The WordPress application relies on an Azure Database for MySQL flexible server named **`"aibook-5d609391c926459b8d5d3c310f489660-dbserver."`** This managed MySQL database service ensures data persistence and provides a scalable solution for storing WordPress site data, such as posts, pages, and user information.

---

## 3. Data Tier (Tier 3):

The data tier, also known as the back-end tier, is responsible for storing and managing data. In this architecture, the data tier comprises the Azure Database for MySQL flexible server mentioned earlier. This database stores all the website's dynamic content, configuration settings, and user data.

---

## Connectivity and Security:

To facilitate secure communication between the presentation tier and the application tier, a Virtual Network (VNet) named **`"aibook-f9c13bca73-vnet"`** is used. The VNet acts as an isolated network environment, allowing secure communication between the Azure resources while providing additional security for the application tier.

Furthermore, to ensure a secure connection between the WordPress application and the MySQL database, a Private DNS Zone named **`"aibook-02df728a16-privatelink.mysql.database.azure.com"`** is used. This Private DNS Zone enables the use of private endpoints, ensuring that data transferred between the application and the database remains within the Azure network, preventing exposure to the public internet.

---
