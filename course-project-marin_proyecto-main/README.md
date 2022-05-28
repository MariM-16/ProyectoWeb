# ICC4103 202210 - Course Project
**Authors:**  (María Marín Torres, Santiago Díaz Ramírez)

## Introduction

The course project consists of five successive assignments, each delivering a product with more advanced features. In the last assignment you will showcase a demonstration of your (hopefully) fully-functional product.

The initial assignment comprises two parts. In the first part you will work on project documentation with regard to analysis (user stories), domain model, and design (wireframes). In the second part, you deliver an initial version of your application codebase in Ruby on Rails.

## Goals

The goals for the present project assignment are as follows:

* Conduct a thorough analysis of the pertaining functional requirements based on user stories.
* Prototype (i.e., wireframe) the views that will be part of the application.
* Understand and define the domain model of the web application.

## Work Teams

In the course project you will work in pairs, and are expected to work with the same partner in all the assignments. Groups shall register through a [Google Form](https://forms.gle/6EHm8vb8Ttj2uK479) by entering the names of the group members. The deadline for group registration is April 1st. If you do not register by the deadline, you will be assigned to a random group/pair.

## Project Description

Every company that offers a product or service needs channels for consumers or users to report problems, difficulties, incidents, or consult with support personnel. An issue tracking system allows users to carry out these actions through tickets. A requesting user creates a new ticket and this is processed by a support executive of the company. The executives are managed by supervisors. We can consider that a ticket has a life cycle that begins when it is created, and ends when the corresponding incident is resolved and the ticket is closed. With regard to tickets, some of the actions that can be carried out are the following:

* [TLC1] The ticket can be automatically assigned to an executive (e.g., the one with the fewest tickets assigned), otherwise, it is manually assigned to an executive by a supervisor. Also, a supervisor can reassign a ticket to another executive. The executive is responsible for resolving the incident reported in the ticket and requesting the user to accept the incident solution.
* [TLC2] The ticket can be prioritized according to the urgency with which an answer or solution is needed.
* [TLC3] The ticket can specify limits for resolving the incident and/or giving an answer to the requesting user.
* [TLC4] The ticket can be commented by the support staff.

In addition, the ticket contains all the following data:

* [TD1] The information of the requesting user, including name, last name, email and telephone. The email must be considered the unique user identifier.
* [TD2] Incident creation date.
* [TD3] Date of incident (and ticket) resolution.
* [TD4] A unique identifier for the incident.
* [TD5] A title that summarizes the incident.
* [TD6] A brief description of the incident.
* [TD7] Priority: urgent, high, normal, low.
* [TD8] State: open, closed, reopened. Note: A ticket can be reopened if it was closed.
* [TD9] Resolution and response keys for the requesting user.
* [TD10] Tags that allow the incident to be categorized.
* [TD11] Attached documents, such as images, videos and PDF files.
* [TD12] The personnel (i.e., support executive) in charge of resolving the ticket.
* [TD13] Comment thread by executive(s) who have processed the ticket.
* [TD14] Response sent to the requesting user.

Requiring users must find in the system:

* [RU1] Site registration and authenticated access, ideally using a Google user account.
* [RU2] A form for requesting creation of tickets, including the relevant fields listed above.
* [RU3] The list of tickets requested by the user, sorted chronologically in descending order.
* [RU4] Possibility of viewing the details of a ticket. Executives' comments on the ticket are not visible to the user; however, the user may provide additional information or details in an open ticket. The user can give acceptance to the executive's response for the ticket to close, and give feedback, for example, expressing their satisfaction with the resolution of the ticket through an evaluation scale from 1 to 5 stars.

An executive must find in the system:

* [EU1] Site registration and authenticated access, ideally using a Google user account. Note: The supervisor user or the administrator (see below) defines which registered user accounts have the role of executive.
* [EU2] The list of tickets that have been assigned. It must be possible to sort the tickets by priority, by closing date and date of response to the user. In the list, it is necessary to show late tickets (i.e., not closed past their deadline), tickets close to deadline, and tickets in deadline, with different colors to easily identify tickets in these different status.
* [EU3] Functions to create and update tickets.
* [EU4] Function to request a user the acceptance of ticket resolution, to close the ticket.
* [EU4] Possibility to search for tickets by users' email, or by words in the title and in the description.

Supervisors require the following roles:

* [SU1] Site registration and authenticated access, ideally using a Google user account. Note: An administrator user has the ability to define which registered user accounts have a supervisor role.
* [SU2] Administration of executives and user accounts. Through this feature, supervisors can assign (or remove) executive role to registered user accounts.
* [SU3] Report tickets by dates: For a given date range, it must include the total number of tickets created, number of open tickets and closed tickets, an a histogram of ticket labels.
* [SU4] Overdue Tickets Report: It should show all open tickets whose closing date is in the past. Tickets should be listed in descending order of closing date, by default. However, the user must be allowed to order them by priority, and by date of response to the user.
* [SU5] Executive performance report: It can be generated annually (only indicating year) or monthly (indicating year and month); for all executives, or for a particular executive. It must include per each executive the number of tickets created, tickets closed, cases that remain open, and the average evaluation of the requesting users when accepting ticket resolution.

The administrator user is unique in the system. You can perform all the actions that a supervisor performs, plus manage supervisor and executive user accounts.

## Additional Assumptions and Requirements

The basic features stated in the previous section comprise the fundamental features that your product is expected to deliver. However, it is possible that some necessary features might have been neglected and therefore you will need to include them as well. You can add any features that you consider necessary in order to comply with the project description.

# Assignment 1.1: Design Document

Your deliverable for assignment 1.1 is a **design document** (PDF) that must contain the following three sections: (1) User Stories, (2) Wireframe Prototypes, and (3) Domain Model.

## User Stories

Write an exhaustive set of user stories for the web application given the project description above and basic functional requirements. Create a section in your design document that lists all the user stories. You may group user stories according to some contextual categorization you define. You may use either a spreadsheet or a word processor to work on this.

## Wireframe Prototypes

You are required to elaborate a series of wireframes that show the visual layout, information design and navigation design your web application, including its initial view, user profiles, input forms, search pages, etc. The wireframes may include some explanatory comments. It must be evident where the navigation menus are, where the main content is displayed, etc.

To build wireframe prototypes you may use Axure RP or Balsamiq Mockups. The wireframes must be included in your documentation, which must be submitted in PDF format. 

Take a look at the document [A Step-by-Step Guide for Beginners: How to Make a Wireframe](https://medium.com/@tristaljing/a-step-by-step-guide-for-beginners-how-to-make-a-wireframe-325b48c2a1ff) published in the course website in Canvas, for a basic conceptual introduction to wireframing construction.

## Domain Model

To elaborate the domain model for the web application, you must write a description of the following elements:

* The actors involved in the system: describe the actors and the different roles in the system (ex. guest user, registered user, admin user, etc.)
* Objects involved in the system: describe the data objects involved (ex. ticket, comment, user profile, etc.).

Once the elements and actors are described, you have to elaborate an Entity-Relationship (E-R) diagram that shows the dependencies between actors and elements, and their cardinalities. 

You may use Axure RP, MS Visio, or other suitable tools to work on this.

## Delivery and Grading

The deadline for the first part of assignment 1 is set for April 8th at 23:59. Your design document must be submitted through your Git repository, in the `docs` folder. Please deliver only one PDF file containing all items asked. The document must include a cover page listing the names of its authors and group number assigned.

Grading will be based on the quality, completeness and consistency of your design document.

The problem statement for the second part of assignment one will be available on Wednesday, April 6th.

