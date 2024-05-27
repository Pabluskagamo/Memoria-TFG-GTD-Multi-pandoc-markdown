# Introduction

## Motivation {#sec:motiv2}

Immersed in the digital age, characterized by the culture of immediacy, it's not an easy task to keep focus and avoid distractions in the middle of a maelstorm of information and stimuli. The *GTD* (Getting Things Done) methodology aims to help people perform their daily tasks in a way that they do not depend on their memory and focus on the now, without being aware of future tasks. This method was created by David Allen, who collected it in his book entitled "Getting Things Done" [@gtd-book] and was translated into Spanish as "Organízate con eficacia".

Likewise, the *GTD* system is known for its effectiveness both personally and professionally in planning, organizing and managing tasks. However, some of the apps that implement it have several problems. First of all, many of these applications do not clearly inform about the process of processing their users' data. (e.g., the data is hosted on third-party servers and their security protocols are unknown).

On the other hand, many of these apps have a high learning curve or are compatible with a small number of operating systems. A clear example of this is Things [@things] which, despite being a very good application, is only available for Apple devices. This conditions the access of this methodology to a more general public.

Therefore, motivated to solve this problem, we seek to develop a multiplatform application that, in addition to implementing the *GTD* methodology, stands out for its intuitive and friendly interface, guided by a *REST* architecture, with the aim of allowing the user to have control of their data, guaranteeing their privacy and transparency. This application, called *SwiftDo*, aims to offer an accessible and versatile alternative for the efficient management of daily tasks.


## Goals

The main objective of this project is to develop a cross-platform *GTD* application. To do this, we have used the *React Native* framework that allows us to create a consistent user interface that works on all major operating systems, such as *Android*, *iOS*, *MacOS*, *GNU/Linux* and *Windows*, and ensures that users can manage their tasks and projects efficiently from any device, no matter what platform they use.

The use of *React Native* simplifies the development, manteinance, and scalability of the project, resulting in an agile application that is adaptable to future updates and changes in the target platforms.

*SwiftDo* stands out for its offline mode, which allows users to manage tasks even without an internet connection (as can be the case on mobile devices). Unlike other alternatives, our app ensures an uninterrupted experience by storing data locally and automatically synchronizing with the server when the connection is restored, ensuring the constant availability of information on all the user's devices.

In the development of *SwiftDo*, the *REST API* plays a crucial role as it provides endpoints for the client-server communication, enabling CRUD operations on data, such as having an *endpoint* '/tareas' for creating and reading tasks. In this way, the *REST API* provides a standardized and efficient interface for data manipulation on out *GTD* platform. In addition, implementing solid security practices, such as authentication and data encryption, ensures the integrity and confidenciality of information, guaranteeing a secure experience for our users.

When developing our application, we pursue a series of specific objectives that were represented by the following high-level requirements.

- **Centralized Task Management:**
  
 The application should allow users to create new tasks which, by default, will be added to the *Inbox* (unorganized task store within the *GTD* methodology). From there, users will be able to assign tags to them, link them to specific projects or areas, and move them between different sections.

- **Flexibility in the Organization:**
  
 Users should have the ability to organize their tasks flexibly, adding them to relevant projects or areas, and assigning them labels for more detailed classification. In addition, the app should allow editing and elimination of tasks as needed.

- **Tracking & Prioritization:**
  
  The app should provide a number of functionalities for tracking and prioritizing tasks efficiently and effectively. Users must have the ability to complete tasks and assign them relative importance. In addition, the app should provide access to detailed information about each task, including its current status, due date, and any associated notes. It's crucial that tasks are automatically prioritized based on their relevance to the user.

- **Security:**
  
 *SwiftDo* must implement a robust authentication and authorization system to ensure that only authorized users can access and manipulate data via the *REST API*. In addition, end-to-end encryption is required to protect the confidentiality of information during its transmission and storage, ensuring a secure experience for all users.

- **Search & Filtering Features:**
  
 Users should be able to search and filter their tasks based on tags, areas, projects, or other relevant criteria, making it easier to manage and view tasks.

- **Usability:**
  
 The app provides an offline mode that allows offline tasks to be managed by storing data locally on the user's device and ensuring continuity of work regardless of online availability.

- **Integration with conversational agents:**
  
 The app integrates with conversational agents such as *Alexa* offering a more versatile experience, allowing users to interact with the app using voice commands, further simplifying task entry and management intuitively and effortlessly.

These requirements provide a solid foundation for the development of the *SwiftDo* application, ensuring a comprehensive experience that complies with the fundamental principles of the *GTD* methodology and meets the needs of users in the effective management of their tasks and projects.

### System Architecture

![System Block Diagram](img/diagramabloques.png){width=100% #fig:bloqusis2}

Figure \ref{fig:bloqusis2} shows the block diagram of the system, which is composed of 2 main components: a client application, essentially made for various devices, and a backend which has a REST API with a secure authorization system.

The client application is implemented with the cross-platform framework *React Native*, and can be executed on various devices. Clients interact via *REST* over *HTTPS* with the backend.

The backend implements 2 main components and includes a database. On the one hand, there is the *OAuth 2.0* module, which is responsible for managing the authentication and authorization flow, that is, it manages the access of the users of the client applications to the information and services provided by the backend. On the other hand, the backend is also composed of an API that follows the *REST* architecture and implements and exposes the different services of the application through various endpoints. Finally, the backend also contains the application's database, which contains both the tables used by the *API REST* module and the *OAuth 2.0* module. All the services contained in the backend are managed through *Docker* containers, so it is possible to start, connect and configure the various modules in a simple and agile way, in order to be able to deploy these services on any machine without the need for further configuration specific to each environment.

Finally, the system contains a third component which allows you to connect some conversational agents with the application. From the clients, it is possible to carry out this configuration of agents by generating a special key for them, so that the agents, once configured, can access the services of the backend through voice commands.

## Work Plan

### Tasks

To carry out the development of the project, we have divided the tasks to be carried out into several phases that are discussed below.

First of all, and individually, we carry out a search by comparing our project model with other existing applications on the market and then sharing the different ideas. Each member of the team installed and analyzed one of these applications and pointed out the possible improvements that we could implement to add more value to our product. Thanks to this exercise, we reached many of the conclusions explained in \ref{sec:motiv2}.

Subsequently, there was a design phase in which we made a mockup of what we would like our application to look like.

Next, we had a learning phase in which we searched for information and experimented with the different tools and components needed to build our application. Among these components, we sought to familiarize ourselves with *Express*, *Docker*, *AWS*, *React Native*, *firebase* among others to make a comparison and choose the technologies that best suited our needs for the future development of our application.

Once we finished the various pre-development tasks discussed above, we started with the programming of the backend which took us approximately four months. During this time we were implementing the main services of the application in addition to the authentication and authorization system. Once the essential part of the backend was finished, we started with the development of the frontend, which has been the most costly phase in terms of time and effort, since we have dedicated a lot of work to create a friendly and usable interface as well as extensive functionality (filtering, searching, editing...). That is why we have been making the necessary updates to the backend for the correct functioning of the application.

### Time planning

The figures \ref{fig:ganttback2} and \ref{fig:ganttfront2} show the tasks associated with the development of the backend and frontend respectively, as well as the start date, end date, and duration of each task:

#### Backend {.unnumbered}

![Backend Gantt chart](img/backendgantt.png){width=100% #fig:ganttback2}

#### Frontend {.unnumbered}

![Frontend Gantt chart](img/frontendgantt.png){width=100% #fig:ganttfront2}

### Memory Structure

The rest of the report is organized as follows:

- In **chapter 2**, an analysis is made of what GTD is, its method and technique. It also describes the several applications in the market that implement *GTD*.
- **Chapter 3** discusses project planning, covering points such as the version control system, the development and integration environments used, and the deployment system.
- In **chapter 4**, we introduce the data model and the implementation of the database. This describes the entities, the physical model of the database, its performance and scalability, and the security of the database.
- **Chapter 5** introduces the design and implementation of the backend, explaining our use of *REST*, *API* design, application endpoints, *API* security aspects, and *OAuth 2.0* implementation.
- **Chapter 6** details the design principles that have guided the creation of the app, along with the different technologies used in its development, from the initial prototyping stage to its implementation, exploring how the fundamentals of the *GTD* method have been implemented in *SwiftDo*.
- **Chapter 7** describes the integration of our *GTD* app with conversational agents, in our case with *Alexa*. We'll explain how we set up the *Alexa* skill, how we linked our user account, the implementation of the *OAuth 2.0* authorization flow, and the issues we encountered during this process.
- In **chapter 8** you will find the user manual, showing the full functionality of our application in an easy and intuitive way.
- **Chapter 9** sets out the main conclusions we have reached and discusses future lines of work.
- This report also consists of four appendices. The first two (Appendices A and B) correspond to the English translation of the introduction and conclusions, the third (Appendix C) lists the contributions that each team member has made to the project, and the last one, (Appendix D) provides a deployment guide so that anyone who wants to use our application can do so.
