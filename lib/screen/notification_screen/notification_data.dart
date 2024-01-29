class NotificationData {


  final String notificationType;
  final String description;
  final String time;
  final String icon;



  NotificationData(  this.notificationType, this.description, this.time, this.icon);
}
List<NotificationData> notificationsData =[

  NotificationData('Reminder','Students will visit the zoo','9:00','assets/icons/reminder'),
  NotificationData('Announcement','Answer Excercises Bag 112','8:00','assets/icons/announcement'),
  NotificationData('New Study Group','All students will gather in the school Garden','8:00','assets/icons/group'),


];
