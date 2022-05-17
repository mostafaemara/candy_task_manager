# Candy Task Manger

A Simple Task Manager App to help user by manage and schedule Tasks

<p float="left">
  <img src="(candy_task_manager/blob/master/5c4f4cd722a64883c7918da006bbb3c0221b2242/image1.jpeg)" width="400" />
  <img src="candy_task_manager/blob/master/5c4f4cd722a64883c7918da006bbb3c0221b2242/image1.jpeg" width="100" /> 
  <img src="candy_task_manager/blob/master/5c4f4cd722a64883c7918da006bbb3c0221b2242/image1.jpeg" width="100" />
    <img src="/candy_task_manager/blob/master/5c4f4cd722a64883c7918da006bbb3c0221b2242/image1.jpeg" width="100" />
      <img src="candy_task_manager/blob/master/5c4f4cd722a64883c7918da006bbb3c0221b2242/image1.jpeg" width="100" />
</p>

## Features

- Schedule tasks and get notification or alarm on choosen date and time
- Mark tasks as Completed from notification action button
- save notifications as alert events on notification displayed
- Cancel task or mark as completed will remove it from the shcedule
- Outdated Tasks Which not marked as completed will Fire a Notification each 24 hour as Missed Task
- Notification screen to show alerts events
- Today screen to show tasks for today
- Upcoming screen to show upcoming tasks grouped by same date
- English and arabic language Support
- Dark Mode Support

## Tools & Packages

### [Awesome Notification](https://pub.dev/packages/awesome_notifications)

show and schdule local notifications with action buttons

### [Work Manger](https://pub.dev/packages/workmanager)

run background periodic task every 24 hours to fetch outdated Incompleted tasks from sqlite database and show notification as missed tasks

### [sqflite](https://pub.dev/packages/sqflite)

save tasks and notification events localy

### [shared_preferences](https://pub.dev/packages/shared_preferences)

help saving user preferences such as selected language

## UI kit

![Design image](https://cdn.dribbble.com/users/180538/screenshots/3710437/media/aef748443f9247f66cf246e2982ea05a.png)

 [UI kit source page](https://dribbble.com/shots/3710437-Free-UI-Kit-Candy)



## Application Architecture

![Design image](../blob/main/arch.png?raw=true)

- Bloc: contains application business logic
- data: Data Layer to interact with datasources such as rest api or local database in our case is sqlite and shared preference so incase we decide to switch to rest api we edite the repositories and models only
- Helpers Usually Dart Extensions on classes  to help others layers by extending functionality and decrease boilerplate
- Managers: Services Layer to deal and manage communications with os system services
- UI: Conatains anything related to views and styling (widgets,colors,sizes,padding,themes)

### Note

I made This Application to learn and try new ways and  techniques it could be done with much simpler way the topics i focus on is

- How to Schedule alarm on specific date and time to get notification as alarm on time even if the screen is turned off.
- How to add action Buttons to notifications and do actions using another layer without explicit that layer to notification manager, for example update sqlite with data on action button clicked i used callback functions and make the communications between notification manger and this layers inside the main, its okay for the main to be polluted with implmentaion details. 
- How to create periodic task that run in the background  even if the app closed and interact with local database (sqlite) and push notifications.
- Try and find new better Architectures
