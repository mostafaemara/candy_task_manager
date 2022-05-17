# Candy Task Manger

A Simple Task Manager App to help user by manage and schedule Tasks

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

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Application Architecture



This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

# candy_app_task_manger
