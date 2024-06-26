import 'package:firebase_messaging/firebase_messaging.dart';

class MyFirebaseMessagingService {
  static Future<void> backgroundMessageHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    // معالجة الرسائل هنا
  }

  static void configureFirebaseListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
    });
  }
}
