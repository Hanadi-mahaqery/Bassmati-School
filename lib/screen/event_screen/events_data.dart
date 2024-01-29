class EventsData {


  final String eventType;
  final String description;
  final String date;
  final String time;
  final String place;

  final String superVisor;


  EventsData(  this.eventType, this.description, this.date, this.superVisor, this.time, this.place,);
}
List<EventsData> eventsData =[

  EventsData('Trip','Students will visit the zoo','9:00','Fep 2nd','T.Mareem','The Zoo'),
  EventsData('Festival','Answer Excercises Bag 112','8:00','Fep 12th','The manager','School'),
  EventsData('Open Day','All students will gather in the school Garden','8:00','Fep 20th','T.Noha','School'),


];
