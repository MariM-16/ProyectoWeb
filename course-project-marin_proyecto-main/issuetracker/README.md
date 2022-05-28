# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
1. Deletion Scenario #1: Explain what should happen model-wise if a ticket is deleted and
reports depend on it; that is, data in the ticket has been considered for accounting/statistics
purposes in reports. Explain how your model layer is well-behaved in this scenario.

[
    When a ticket is deleted, its data would be removed from the created reports that contain it, 
    giving a data update to each corresponding report, so that there is no statistical discordance. 
    In our model, the ticket_id would be removed from the list of tickets of the user and the 
    corresponding executive, and new reports would be created with the updated information.
]

2. Deletion Scenario #2: Explain what should happen model-wise if an executive is deleted and
tickets have been assigned to them, and tickets have resolutions and comments written by the
deleted executive. Explain how your model layer is well-behaved in this scenario.

 [
    When deleting an executive, he/she is reassigned to the supervisor in charge and if the tickets
    have not been resolved the supervisor can reassign the tickets to the existing executives, also 
    the comments and resolutions will continue to exist but with the id and data of the supervisor in charge. 
 ]

 ## Assignment 2

  **Summary of implemented features** 

 For this deliverable we were asked to develop the first approach to the website we want to implement for this project. As a base of the page, we made the pertinent routing between the tables of our model, in order to have linked and nested (if necessary) everything that is fundamental for the use of the page. To explain what our application setup consists of, we will first show a HOME PAGE in which we will present the description of the page and a default button to create new tickets, and list of tickets open. SignUp and LogIn buttons, with their specific text fields when opened. As shown in the first installment, the page presentation was changed from vertical to horizontal, just in order to better distribute the tables and lists throughout the format. Our top toolbar, includes the linking buttons to the different sections of sites that were requested, in this case is: user profile, tickets, performance and user list. In which, in order, they contain: the details of a randomly determined user in order to give an idea of what you want to show. Along with the list of tickets for that particular user. The second section shows a complete list of all tickets issued by users, in a list that has the options to make a visualization of each ticket, in which the ticket data and lists the comments and responses of the executive in charge of the ticket are presented, along with their editing options. Thirdly, there is performance where the evaluations of the executives in their technical support work are included. And finally, there is the list of all existing users on the page, routed to their individual profiles and ticket lists.

 **Summary of features required in the assignment but pending.**
As requested, an overview of what the site would look like as a supervisor or administrator was made. Therefore, each attribute or function that the different existing user roles may have is not 100% implemented. That is to say, some reports that are shown to the admins, some work tools for the executives, etc. may be missing. A detail that is noticed in the ticket lists, is that by default they are shown in chronological order, but its date cataloguer and search engine were not included. More than anything else, they are summarized in specific details, that in the long run of the project can be improved.

 **API Tests, which should include links to your Postman collection containing tests for your APIs**
Link Postman API: 

https://www.getpostman.com/collections/dd45257f2ba8683173e1
